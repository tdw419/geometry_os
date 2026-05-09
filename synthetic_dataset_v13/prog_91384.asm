; DESCRIPTION: Composite: Places a blue dot at position (36, 7) then Renders a magenta disk with center (209, 152) and radius 76 then Draws a orange line from (383, 152) to (204, 130).
; PLAN: r0=36(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=152(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=152(y1), r12=204(x2), r13=130(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 152
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 152
LDI r12, 204
LDI r13, 130
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
