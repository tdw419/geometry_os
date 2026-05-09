; DESCRIPTION: Composite: Places a magenta dot at position (90, 144) then Creates a black rectangular region at (77, 36) spanning 82 by 95 pixels then Renders a purple disk with center (156, 180) and radius 63.
; PLAN: r0=90(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=36(y), r7=82(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=180(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 36
LDI r7, 82
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 180
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
