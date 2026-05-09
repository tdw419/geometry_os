; DESCRIPTION: Renders a purple line between points (429, 141) and (294, 0).
; PLAN: r0=429(x1), r1=141(y1), r2=294(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 141
LDI r2, 294
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
