; DESCRIPTION: Composite: Places a cyan line segment connecting (147, 200) to (63, 191) then Renders a orange box of size 12x93 starting at (39, 62).
; PLAN: r0=147(x1), r1=200(y1), r2=63(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=62(y), r7=12(width), r8=93(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 200
LDI r2, 63
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 62
LDI r7, 12
LDI r8, 93
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
