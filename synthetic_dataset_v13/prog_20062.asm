; DESCRIPTION: Composite: Places a yellow dot at position (217, 49) then Renders a blue line between points (480, 179) and (150, 30) then Draws a blue rectangle at (164, 82) with width 73 and height 88.
; PLAN: r0=217(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=480(x1), r6=179(y1), r7=150(x2), r8=30(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=82(y), r12=73(width), r13=88(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 480
LDI r6, 179
LDI r7, 150
LDI r8, 30
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 82
LDI r12, 73
LDI r13, 88
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
