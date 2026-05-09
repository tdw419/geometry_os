; DESCRIPTION: Composite: Renders a black box of size 120x82 starting at (141, 122) then Draws a red line from (106, 146) to (134, 37) then Sets a single black pixel at (244, 223).
; PLAN: r0=141(x), r1=122(y), r2=120(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=146(y1), r7=134(x2), r8=37(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=223(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 122
LDI r2, 120
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 146
LDI r7, 134
LDI r8, 37
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 223
LDI r12, 0x000000
PSET r10, r11, r12
HALT
