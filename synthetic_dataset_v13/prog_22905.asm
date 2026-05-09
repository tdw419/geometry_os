; DESCRIPTION: Composite: Places a blue dot at position (191, 238) then Creates a blue circular shape at (425, 87) with radius 24 then Draws a orange line from (150, 18) to (29, 107).
; PLAN: r0=191(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=87(y), r7=24(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=150(x1), r11=18(y1), r12=29(x2), r13=107(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 87
LDI r7, 24
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 150
LDI r11, 18
LDI r12, 29
LDI r13, 107
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
