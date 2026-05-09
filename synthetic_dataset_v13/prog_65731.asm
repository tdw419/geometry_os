; DESCRIPTION: Renders a white line between points (352, 178) and (363, 118).
; PLAN: r0=352(x1), r1=178(y1), r2=363(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 178
LDI r2, 363
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
