; DESCRIPTION: Composite: Renders a green line between points (410, 126) and (496, 49) then Creates a red circular shape at (256, 205) with radius 13.
; PLAN: r0=410(x1), r1=126(y1), r2=496(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=205(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 126
LDI r2, 496
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 205
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
