; DESCRIPTION: Composite: Renders a purple line between points (153, 63) and (285, 224) then Places a cyan circle of radius 58 at center (156, 95).
; PLAN: r0=153(x1), r1=63(y1), r2=285(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=95(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 63
LDI r2, 285
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 95
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
