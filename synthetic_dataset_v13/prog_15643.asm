; DESCRIPTION: Composite: Places a green line segment connecting (328, 184) to (442, 27) then Creates a cyan circular shape at (341, 141) with radius 74.
; PLAN: r0=328(x1), r1=184(y1), r2=442(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=141(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 184
LDI r2, 442
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 141
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
