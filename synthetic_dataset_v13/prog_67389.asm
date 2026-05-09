; DESCRIPTION: Composite: Sets a single red pixel at (21, 30) then Renders a blue line between points (261, 49) and (215, 27) then Draws a purple rectangle at (255, 32) with width 57 and height 113.
; PLAN: r0=21(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=49(y1), r7=215(x2), r8=27(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=32(y), r12=57(width), r13=113(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 49
LDI r7, 215
LDI r8, 27
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 32
LDI r12, 57
LDI r13, 113
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
