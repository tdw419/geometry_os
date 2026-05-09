; DESCRIPTION: Composite: Renders a magenta box of size 36x21 starting at (28, 172) then Renders a black line between points (352, 44) and (458, 195) then Sets a single blue pixel at (139, 183).
; PLAN: r0=28(x), r1=172(y), r2=36(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=44(y1), r7=458(x2), r8=195(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=183(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 172
LDI r2, 36
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 44
LDI r7, 458
LDI r8, 195
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 183
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
