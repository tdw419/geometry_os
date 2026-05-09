; DESCRIPTION: Composite: Renders a orange box of size 110x83 starting at (179, 146) then Renders a magenta line between points (421, 195) and (14, 233).
; PLAN: r0=179(x), r1=146(y), r2=110(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=195(y1), r7=14(x2), r8=233(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 146
LDI r2, 110
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 195
LDI r7, 14
LDI r8, 233
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
