; DESCRIPTION: Draws a black line from (141, 190) to (474, 138).
; PLAN: r0=141(x1), r1=190(y1), r2=474(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 190
LDI r2, 474
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
