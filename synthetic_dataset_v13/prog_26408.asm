; DESCRIPTION: Composite: Places a blue dot at position (206, 205) then Draws a yellow circle centered at (366, 144) with radius 58 then Draws a black line from (422, 107) to (509, 210).
; PLAN: r0=206(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=144(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=422(x1), r11=107(y1), r12=509(x2), r13=210(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 144
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 422
LDI r11, 107
LDI r12, 509
LDI r13, 210
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
