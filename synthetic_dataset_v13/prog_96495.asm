; DESCRIPTION: Composite: Places a blue line segment connecting (394, 2) to (350, 228) then Creates a magenta circular shape at (182, 89) with radius 24.
; PLAN: r0=394(x1), r1=2(y1), r2=350(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=89(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 2
LDI r2, 350
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 89
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
