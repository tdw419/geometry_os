; DESCRIPTION: Composite: Sets a single blue pixel at (419, 80) then Renders a purple box of size 58x105 starting at (304, 95) then Renders a magenta disk with center (450, 195) and radius 39.
; PLAN: r0=419(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=95(y), r7=58(width), r8=105(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x), r11=195(y), r12=39(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 95
LDI r7, 58
LDI r8, 105
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 195
LDI r12, 39
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
