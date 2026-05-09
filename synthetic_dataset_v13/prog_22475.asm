; DESCRIPTION: Composite: Renders a red disk with center (308, 127) and radius 80 then Creates a blue rectangular region at (236, 113) spanning 82 by 10 pixels then Sets a single purple pixel at (166, 231).
; PLAN: r0=308(x), r1=127(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=113(y), r7=82(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x), r11=231(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 127
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 113
LDI r7, 82
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 231
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
