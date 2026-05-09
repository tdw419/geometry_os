; DESCRIPTION: Composite: Places a orange 120x79 rectangle at position (44, 81) then Draws a white line from (147, 198) to (488, 203).
; PLAN: r0=44(x), r1=81(y), r2=120(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x1), r6=198(y1), r7=488(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 81
LDI r2, 120
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 198
LDI r7, 488
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
