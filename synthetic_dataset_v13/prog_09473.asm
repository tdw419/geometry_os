; DESCRIPTION: Composite: Draws a magenta line from (50, 144) to (490, 133) then Renders a black disk with center (72, 87) and radius 32.
; PLAN: r0=50(x1), r1=144(y1), r2=490(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=87(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 144
LDI r2, 490
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 87
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
