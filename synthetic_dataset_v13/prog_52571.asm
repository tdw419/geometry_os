; DESCRIPTION: Renders a orange line between points (328, 73) and (9, 177).
; PLAN: r0=328(x1), r1=73(y1), r2=9(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 73
LDI r2, 9
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
