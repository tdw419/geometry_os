; DESCRIPTION: Composite: Places a orange dot at position (176, 69) then Renders a purple line between points (206, 246) and (403, 121) then Creates a white rectangular region at (274, 93) spanning 64 by 106 pixels.
; PLAN: r0=176(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=246(y1), r7=403(x2), r8=121(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=93(y), r12=64(width), r13=106(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 206
LDI r6, 246
LDI r7, 403
LDI r8, 121
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 93
LDI r12, 64
LDI r13, 106
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
