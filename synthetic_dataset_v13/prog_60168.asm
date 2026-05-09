; DESCRIPTION: Composite: Renders a black line between points (437, 162) and (257, 82) then Draws a cyan circle centered at (406, 64) with radius 49.
; PLAN: r0=437(x1), r1=162(y1), r2=257(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=64(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 162
LDI r2, 257
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 64
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
