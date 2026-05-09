; DESCRIPTION: Composite: Draws a white rectangle at (251, 31) with width 79 and height 112 then Draws a red line from (103, 219) to (198, 233).
; PLAN: r0=251(x), r1=31(y), r2=79(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=219(y1), r7=198(x2), r8=233(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 31
LDI r2, 79
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 219
LDI r7, 198
LDI r8, 233
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
