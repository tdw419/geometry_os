; DESCRIPTION: Renders a cyan line between points (116, 31) and (429, 112).
; PLAN: r0=116(x1), r1=31(y1), r2=429(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 31
LDI r2, 429
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
