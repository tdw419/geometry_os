; DESCRIPTION: Renders a black line between points (452, 191) and (228, 3).
; PLAN: r0=452(x1), r1=191(y1), r2=228(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 191
LDI r2, 228
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
