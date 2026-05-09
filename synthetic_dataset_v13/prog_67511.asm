; DESCRIPTION: Composite: Creates a white rectangular region at (108, 94) spanning 46 by 109 pixels then Draws a blue line from (243, 88) to (257, 7) then Places a yellow dot at position (316, 77).
; PLAN: r0=108(x), r1=94(y), r2=46(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x1), r6=88(y1), r7=257(x2), r8=7(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=77(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 94
LDI r2, 46
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 88
LDI r7, 257
LDI r8, 7
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 77
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
