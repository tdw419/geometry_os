; DESCRIPTION: Composite: Renders a magenta box of size 101x48 starting at (336, 62) then Renders a yellow line between points (391, 200) and (194, 8) then Sets a single green pixel at (413, 190).
; PLAN: r0=336(x), r1=62(y), r2=101(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=200(y1), r7=194(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=413(x), r11=190(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 62
LDI r2, 101
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 200
LDI r7, 194
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 190
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
