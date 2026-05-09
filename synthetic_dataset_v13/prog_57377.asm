; DESCRIPTION: Composite: Renders a white line between points (30, 200) and (96, 4) then Renders a orange box of size 106x22 starting at (133, 115).
; PLAN: r0=30(x1), r1=200(y1), r2=96(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=115(y), r7=106(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 200
LDI r2, 96
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 115
LDI r7, 106
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
