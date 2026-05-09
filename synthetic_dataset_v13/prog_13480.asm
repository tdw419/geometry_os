; DESCRIPTION: Composite: Draws a black line from (247, 192) to (143, 205) then Renders a orange disk with center (64, 88) and radius 16.
; PLAN: r0=247(x1), r1=192(y1), r2=143(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=88(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 192
LDI r2, 143
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 88
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
