; DESCRIPTION: Composite: Sets a single yellow pixel at (39, 40) then Places a purple line segment connecting (12, 50) to (115, 155) then Places a magenta 115x111 rectangle at position (90, 32).
; PLAN: r0=39(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=50(y1), r7=115(x2), r8=155(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=32(y), r12=115(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 12
LDI r6, 50
LDI r7, 115
LDI r8, 155
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 32
LDI r12, 115
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
