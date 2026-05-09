; DESCRIPTION: Composite: Draws a white line from (2, 104) to (68, 89) then Draws a purple rectangle at (125, 72) with width 60 and height 42.
; PLAN: r0=2(x1), r1=104(y1), r2=68(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=72(y), r7=60(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 104
LDI r2, 68
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 72
LDI r7, 60
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
