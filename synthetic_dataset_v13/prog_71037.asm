; DESCRIPTION: Composite: Places a white circle of radius 25 at center (140, 190) then Places a magenta line segment connecting (21, 27) to (270, 246) then Sets a single green pixel at (246, 238).
; PLAN: r0=140(x), r1=190(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=27(y1), r7=270(x2), r8=246(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=238(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 190
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 27
LDI r7, 270
LDI r8, 246
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 238
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
