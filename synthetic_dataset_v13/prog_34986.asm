; DESCRIPTION: Composite: Renders a purple line between points (275, 28) and (23, 39) then Creates a green circular shape at (53, 124) with radius 28.
; PLAN: r0=275(x1), r1=28(y1), r2=23(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=124(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 28
LDI r2, 23
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 124
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
