; DESCRIPTION: Composite: Renders a blue box of size 95x63 starting at (177, 102) then Draws a red line from (256, 61) to (465, 69) then Sets a single black pixel at (35, 244).
; PLAN: r0=177(x), r1=102(y), r2=95(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=61(y1), r7=465(x2), r8=69(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=244(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 102
LDI r2, 95
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 61
LDI r7, 465
LDI r8, 69
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 244
LDI r12, 0x000000
PSET r10, r11, r12
HALT
