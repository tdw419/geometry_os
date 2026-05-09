; DESCRIPTION: Composite: Draws a white rectangle at (15, 124) with width 87 and height 11 then Draws a red line from (503, 40) to (358, 94).
; PLAN: r0=15(x), r1=124(y), r2=87(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x1), r6=40(y1), r7=358(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 124
LDI r2, 87
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 40
LDI r7, 358
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
