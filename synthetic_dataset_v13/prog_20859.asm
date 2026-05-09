; DESCRIPTION: Composite: Places a cyan line segment connecting (219, 94) to (193, 41) then Draws a green rectangle at (326, 103) with width 45 and height 74.
; PLAN: r0=219(x1), r1=94(y1), r2=193(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=103(y), r7=45(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 94
LDI r2, 193
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 103
LDI r7, 45
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
