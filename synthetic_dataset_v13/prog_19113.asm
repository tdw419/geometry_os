; DESCRIPTION: Composite: Renders a cyan box of size 75x63 starting at (137, 105) then Places a orange line segment connecting (258, 113) to (76, 238).
; PLAN: r0=137(x), r1=105(y), r2=75(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=113(y1), r7=76(x2), r8=238(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 105
LDI r2, 75
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 113
LDI r7, 76
LDI r8, 238
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
