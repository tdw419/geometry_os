; DESCRIPTION: Renders a black line between points (80, 191) and (393, 182).
; PLAN: r0=80(x1), r1=191(y1), r2=393(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 191
LDI r2, 393
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
