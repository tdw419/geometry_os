; DESCRIPTION: Composite: Places a blue 94x114 rectangle at position (127, 111) then Draws a green line from (169, 108) to (233, 217) then Sets a single magenta pixel at (1, 77).
; PLAN: r0=127(x), r1=111(y), r2=94(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=108(y1), r7=233(x2), r8=217(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=1(x), r11=77(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 111
LDI r2, 94
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 108
LDI r7, 233
LDI r8, 217
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 1
LDI r11, 77
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
