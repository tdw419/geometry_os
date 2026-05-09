; DESCRIPTION: Composite: Draws a green line from (400, 250) to (399, 82) then Creates a red rectangular region at (311, 35) spanning 29 by 35 pixels then Places a purple dot at position (357, 206).
; PLAN: r0=400(x1), r1=250(y1), r2=399(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=35(y), r7=29(width), r8=35(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=357(x), r11=206(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 250
LDI r2, 399
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 35
LDI r7, 29
LDI r8, 35
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 206
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
