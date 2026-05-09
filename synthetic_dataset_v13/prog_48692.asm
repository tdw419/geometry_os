; DESCRIPTION: Composite: Renders a orange line between points (128, 88) and (220, 125) then Renders a white box of size 29x22 starting at (121, 10).
; PLAN: r0=128(x1), r1=88(y1), r2=220(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=10(y), r7=29(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 88
LDI r2, 220
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 10
LDI r7, 29
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
