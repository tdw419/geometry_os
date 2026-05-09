; DESCRIPTION: Composite: Places a black circle of radius 78 at center (82, 134) then Renders a cyan line between points (189, 219) and (452, 4).
; PLAN: r0=82(x), r1=134(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=219(y1), r7=452(x2), r8=4(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 134
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 219
LDI r7, 452
LDI r8, 4
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
