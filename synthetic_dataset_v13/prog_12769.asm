; DESCRIPTION: Composite: Sets a single magenta pixel at (82, 238) then Renders a blue line between points (118, 62) and (134, 255) then Creates a black rectangular region at (193, 61) spanning 69 by 94 pixels.
; PLAN: r0=82(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=62(y1), r7=134(x2), r8=255(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=61(y), r12=69(width), r13=94(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 62
LDI r7, 134
LDI r8, 255
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 61
LDI r12, 69
LDI r13, 94
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
