; DESCRIPTION: Composite: Places a red 25x72 rectangle at position (121, 68) then Draws a blue line from (337, 1) to (313, 14) then Sets a single purple pixel at (73, 157).
; PLAN: r0=121(x), r1=68(y), r2=25(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x1), r6=1(y1), r7=313(x2), r8=14(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=157(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 68
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 1
LDI r7, 313
LDI r8, 14
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 157
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
