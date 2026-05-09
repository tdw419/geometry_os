; DESCRIPTION: Composite: Renders a cyan disk with center (94, 37) and radius 25 then Places a orange line segment connecting (3, 47) to (23, 206) then Places a green dot at position (205, 179).
; PLAN: r0=94(x), r1=37(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x1), r6=47(y1), r7=23(x2), r8=206(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=179(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 37
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 47
LDI r7, 23
LDI r8, 206
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 179
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
