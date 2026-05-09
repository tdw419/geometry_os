; DESCRIPTION: Renders a white line between points (149, 98) and (352, 186).
; PLAN: r0=149(x1), r1=98(y1), r2=352(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 98
LDI r2, 352
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
