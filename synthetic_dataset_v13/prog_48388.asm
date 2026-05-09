; DESCRIPTION: Composite: Places a cyan line segment connecting (72, 19) to (293, 84) then Creates a magenta circular shape at (262, 137) with radius 57.
; PLAN: r0=72(x1), r1=19(y1), r2=293(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=137(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 19
LDI r2, 293
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 137
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
