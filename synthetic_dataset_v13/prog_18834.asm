; DESCRIPTION: Composite: Places a purple line segment connecting (106, 37) to (307, 239) then Creates a yellow circular shape at (380, 61) with radius 36.
; PLAN: r0=106(x1), r1=37(y1), r2=307(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=61(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 37
LDI r2, 307
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 61
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
