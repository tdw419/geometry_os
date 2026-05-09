; DESCRIPTION: Composite: Places a white dot at position (270, 170) then Draws a orange circle centered at (186, 130) with radius 60 then Draws a cyan line from (496, 4) to (141, 204).
; PLAN: r0=270(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=130(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x1), r11=4(y1), r12=141(x2), r13=204(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 130
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 4
LDI r12, 141
LDI r13, 204
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
