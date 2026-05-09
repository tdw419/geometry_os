; DESCRIPTION: Composite: Sets a single yellow pixel at (265, 206) then Draws a black line from (337, 62) to (506, 65).
; PLAN: r0=265(x), r1=206(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=62(y1), r7=506(x2), r8=65(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 206
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 62
LDI r7, 506
LDI r8, 65
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
