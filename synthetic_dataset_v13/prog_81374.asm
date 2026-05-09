; DESCRIPTION: Composite: Draws a white rectangle at (95, 143) with width 10 and height 97 then Draws a black line from (78, 1) to (113, 73).
; PLAN: r0=95(x), r1=143(y), r2=10(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=1(y1), r7=113(x2), r8=73(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 143
LDI r2, 10
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 1
LDI r7, 113
LDI r8, 73
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
