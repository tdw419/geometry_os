; DESCRIPTION: Composite: Creates a purple rectangular region at (322, 10) spanning 36 by 73 pixels then Renders a white line between points (506, 126) and (167, 169) then Places a purple dot at position (233, 222).
; PLAN: r0=322(x), r1=10(y), r2=36(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x1), r6=126(y1), r7=167(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=222(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 10
LDI r2, 36
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 126
LDI r7, 167
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 222
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
