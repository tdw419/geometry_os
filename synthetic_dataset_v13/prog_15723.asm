; DESCRIPTION: Composite: Draws a green line from (117, 25) to (233, 240) then Creates a black rectangular region at (338, 172) spanning 98 by 57 pixels then Places a purple dot at position (337, 106).
; PLAN: r0=117(x1), r1=25(y1), r2=233(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=172(y), r7=98(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=106(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 25
LDI r2, 233
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 172
LDI r7, 98
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 106
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
