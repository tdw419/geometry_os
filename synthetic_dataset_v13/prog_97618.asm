; DESCRIPTION: Composite: Renders a purple line between points (76, 10) and (246, 61) then Creates a cyan circular shape at (401, 192) with radius 24.
; PLAN: r0=76(x1), r1=10(y1), r2=246(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=192(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 10
LDI r2, 246
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 192
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
