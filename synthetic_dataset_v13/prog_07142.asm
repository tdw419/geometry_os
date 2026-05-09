; DESCRIPTION: Composite: Creates a blue rectangular region at (454, 10) spanning 19 by 17 pixels then Draws a white line from (207, 114) to (161, 34) then Sets a single magenta pixel at (395, 159).
; PLAN: r0=454(x), r1=10(y), r2=19(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=114(y1), r7=161(x2), r8=34(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=159(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 454
LDI r1, 10
LDI r2, 19
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 114
LDI r7, 161
LDI r8, 34
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 159
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
