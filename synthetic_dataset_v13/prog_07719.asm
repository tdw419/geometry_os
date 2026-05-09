; DESCRIPTION: Renders a black line between points (361, 248) and (228, 105).
; PLAN: r0=361(x1), r1=248(y1), r2=228(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 248
LDI r2, 228
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
