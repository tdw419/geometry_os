; DESCRIPTION: Composite: Creates a green circular shape at (121, 94) with radius 60 then Places a magenta line segment connecting (510, 41) to (172, 139) then Places a green dot at position (250, 127).
; PLAN: r0=121(x), r1=94(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x1), r6=41(y1), r7=172(x2), r8=139(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=127(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 94
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 41
LDI r7, 172
LDI r8, 139
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 127
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
