; DESCRIPTION: Composite: Creates a red rectangular region at (426, 100) spanning 38 by 81 pixels then Renders a white line between points (383, 193) and (10, 227) then Places a purple dot at position (143, 163).
; PLAN: r0=426(x), r1=100(y), r2=38(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=193(y1), r7=10(x2), r8=227(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=163(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 100
LDI r2, 38
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 193
LDI r7, 10
LDI r8, 227
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 163
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
