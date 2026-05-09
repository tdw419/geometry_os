; DESCRIPTION: Composite: Places a magenta circle of radius 44 at center (173, 83) then Places a red line segment connecting (140, 65) to (509, 195) then Places a purple dot at position (386, 134).
; PLAN: r0=173(x), r1=83(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=65(y1), r7=509(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=134(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 83
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 65
LDI r7, 509
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 134
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
