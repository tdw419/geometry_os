; DESCRIPTION: Composite: Draws a blue line from (236, 190) to (464, 134) then Draws a white rectangle at (465, 191) with width 36 and height 32.
; PLAN: r0=236(x1), r1=190(y1), r2=464(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=191(y), r7=36(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 190
LDI r2, 464
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 191
LDI r7, 36
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
