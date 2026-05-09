; DESCRIPTION: Composite: Renders a cyan box of size 24x98 starting at (12, 80) then Renders a orange line between points (223, 8) and (94, 136).
; PLAN: r0=12(x), r1=80(y), r2=24(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x1), r6=8(y1), r7=94(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 80
LDI r2, 24
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 8
LDI r7, 94
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
