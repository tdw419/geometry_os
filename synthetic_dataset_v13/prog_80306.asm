; DESCRIPTION: Composite: Draws a blue line from (333, 254) to (488, 203) then Places a purple 118x70 rectangle at position (77, 113).
; PLAN: r0=333(x1), r1=254(y1), r2=488(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=113(y), r7=118(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 254
LDI r2, 488
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 113
LDI r7, 118
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
