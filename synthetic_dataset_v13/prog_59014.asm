; DESCRIPTION: Composite: Draws a black line from (322, 171) to (14, 127) then Places a red dot at position (337, 80) then Draws a white rectangle at (3, 150) with width 92 and height 40.
; PLAN: r0=322(x1), r1=171(y1), r2=14(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=3(x), r11=150(y), r12=92(width), r13=40(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 171
LDI r2, 14
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 3
LDI r11, 150
LDI r12, 92
LDI r13, 40
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
