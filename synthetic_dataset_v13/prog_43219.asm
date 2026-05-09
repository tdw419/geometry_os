; DESCRIPTION: Composite: Sets a single magenta pixel at (11, 35) then Draws a blue line from (359, 204) to (344, 67) then Creates a white rectangular region at (196, 127) spanning 17 by 25 pixels.
; PLAN: r0=11(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x1), r6=204(y1), r7=344(x2), r8=67(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=127(y), r12=17(width), r13=25(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 204
LDI r7, 344
LDI r8, 67
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 127
LDI r12, 17
LDI r13, 25
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
