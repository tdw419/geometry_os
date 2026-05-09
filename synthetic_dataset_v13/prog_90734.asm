; DESCRIPTION: Renders a white line between points (252, 177) and (31, 186).
; PLAN: r0=252(x1), r1=177(y1), r2=31(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 177
LDI r2, 31
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
