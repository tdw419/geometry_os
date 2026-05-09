; DESCRIPTION: Composite: Renders a yellow line between points (145, 157) and (491, 24) then Renders a orange box of size 14x120 starting at (126, 66).
; PLAN: r0=145(x1), r1=157(y1), r2=491(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=66(y), r7=14(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 157
LDI r2, 491
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 66
LDI r7, 14
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
