; DESCRIPTION: Composite: Renders a magenta box of size 63x95 starting at (363, 66) then Places a purple line segment connecting (426, 228) to (186, 44) then Renders a green disk with center (172, 144) and radius 15.
; PLAN: r0=363(x), r1=66(y), r2=63(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x1), r6=228(y1), r7=186(x2), r8=44(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=144(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 66
LDI r2, 63
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 228
LDI r7, 186
LDI r8, 44
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 144
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
