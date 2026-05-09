; DESCRIPTION: Renders a white line between points (46, 12) and (177, 249).
; PLAN: r0=46(x1), r1=12(y1), r2=177(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 12
LDI r2, 177
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
