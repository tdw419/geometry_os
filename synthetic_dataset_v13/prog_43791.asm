; DESCRIPTION: Composite: Draws a blue rectangle at (112, 141) with width 79 and height 56 then Draws a white line from (211, 197) to (344, 136).
; PLAN: r0=112(x), r1=141(y), r2=79(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x1), r6=197(y1), r7=344(x2), r8=136(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 141
LDI r2, 79
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 197
LDI r7, 344
LDI r8, 136
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
