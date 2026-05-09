; DESCRIPTION: Composite: Places a cyan line segment connecting (245, 80) to (252, 87) then Renders a blue box of size 120x95 starting at (13, 105).
; PLAN: r0=245(x1), r1=80(y1), r2=252(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=105(y), r7=120(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 80
LDI r2, 252
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 105
LDI r7, 120
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
