; DESCRIPTION: Composite: Places a orange dot at position (139, 240) then Renders a magenta line between points (237, 59) and (216, 125) then Creates a white rectangular region at (195, 73) spanning 72 by 65 pixels.
; PLAN: r0=139(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=59(y1), r7=216(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=73(y), r12=72(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 237
LDI r6, 59
LDI r7, 216
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 73
LDI r12, 72
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
