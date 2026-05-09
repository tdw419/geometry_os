; DESCRIPTION: Composite: Sets a single purple pixel at (90, 145) then Draws a green line from (110, 224) to (228, 6) then Renders a purple disk with center (64, 68) and radius 60.
; PLAN: r0=90(x), r1=145(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=224(y1), r7=228(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=68(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 145
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 224
LDI r7, 228
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 68
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
