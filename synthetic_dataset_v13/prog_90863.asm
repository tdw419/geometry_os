; DESCRIPTION: Renders a white line between points (126, 14) and (194, 182).
; PLAN: r0=126(x1), r1=14(y1), r2=194(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 14
LDI r2, 194
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
