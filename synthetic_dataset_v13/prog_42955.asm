; DESCRIPTION: Composite: Places a cyan circle of radius 18 at center (19, 134) then Places a green line segment connecting (329, 182) to (191, 114) then Places a purple dot at position (428, 57).
; PLAN: r0=19(x), r1=134(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=182(y1), r7=191(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=57(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 134
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 182
LDI r7, 191
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 57
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
