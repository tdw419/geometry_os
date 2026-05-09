; DESCRIPTION: Renders a white line between points (121, 21) and (177, 36).
; PLAN: r0=121(x1), r1=21(y1), r2=177(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 21
LDI r2, 177
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
