; DESCRIPTION: Composite: Places a cyan dot at position (145, 130) then Draws a blue circle centered at (83, 187) with radius 18 then Renders a cyan line between points (104, 102) and (101, 233).
; PLAN: r0=145(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=187(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x1), r11=102(y1), r12=101(x2), r13=233(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 187
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 102
LDI r12, 101
LDI r13, 233
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
