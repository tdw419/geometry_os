; DESCRIPTION: Renders a black line between points (172, 228) and (418, 18).
; PLAN: r0=172(x1), r1=228(y1), r2=418(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 228
LDI r2, 418
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
