; DESCRIPTION: Composite: Draws a blue line from (481, 172) to (431, 204) then Creates a cyan circular shape at (420, 156) with radius 64.
; PLAN: r0=481(x1), r1=172(y1), r2=431(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=156(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 172
LDI r2, 431
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 156
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
