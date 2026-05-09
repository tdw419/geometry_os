; DESCRIPTION: Composite: Places a red line segment connecting (256, 3) to (125, 233) then Renders a white box of size 46x74 starting at (463, 178).
; PLAN: r0=256(x1), r1=3(y1), r2=125(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=178(y), r7=46(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 3
LDI r2, 125
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 178
LDI r7, 46
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
