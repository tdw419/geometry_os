; DESCRIPTION: Renders a black line between points (190, 82) and (401, 203).
; PLAN: r0=190(x1), r1=82(y1), r2=401(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 82
LDI r2, 401
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
