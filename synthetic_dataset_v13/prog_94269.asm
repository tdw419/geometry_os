; DESCRIPTION: Composite: Places a cyan 23x78 rectangle at position (468, 18) then Places a magenta line segment connecting (184, 216) to (461, 46).
; PLAN: r0=468(x), r1=18(y), r2=23(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=216(y1), r7=461(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 18
LDI r2, 23
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 216
LDI r7, 461
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
