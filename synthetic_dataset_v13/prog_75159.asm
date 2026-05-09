; DESCRIPTION: Renders a purple line between points (405, 120) and (458, 206).
; PLAN: r0=405(x1), r1=120(y1), r2=458(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 120
LDI r2, 458
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
