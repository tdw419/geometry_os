; DESCRIPTION: Composite: Draws a cyan line from (371, 143) to (495, 177) then Draws a purple rectangle at (262, 117) with width 72 and height 29.
; PLAN: r0=371(x1), r1=143(y1), r2=495(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=117(y), r7=72(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 143
LDI r2, 495
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 117
LDI r7, 72
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
