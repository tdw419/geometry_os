; DESCRIPTION: Composite: Places a cyan dot at position (49, 192) then Renders a orange disk with center (66, 201) and radius 19 then Places a green line segment connecting (151, 185) to (362, 6).
; PLAN: r0=49(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=201(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x1), r11=185(y1), r12=362(x2), r13=6(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 201
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 185
LDI r12, 362
LDI r13, 6
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
