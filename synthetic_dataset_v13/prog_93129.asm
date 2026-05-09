; DESCRIPTION: Composite: Renders a yellow line between points (56, 220) and (223, 116) then Creates a white rectangular region at (131, 206) spanning 97 by 22 pixels then Places a purple dot at position (73, 55).
; PLAN: r0=56(x1), r1=220(y1), r2=223(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=206(y), r7=97(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=55(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 56
LDI r1, 220
LDI r2, 223
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 206
LDI r7, 97
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 55
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
