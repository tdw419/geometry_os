; DESCRIPTION: Renders a red line between points (352, 218) and (208, 26).
; PLAN: r0=352(x1), r1=218(y1), r2=208(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 218
LDI r2, 208
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
