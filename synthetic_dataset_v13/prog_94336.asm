; DESCRIPTION: Renders a white line between points (223, 138) and (279, 186).
; PLAN: r0=223(x1), r1=138(y1), r2=279(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 138
LDI r2, 279
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
