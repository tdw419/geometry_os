; DESCRIPTION: Renders a white line between points (440, 11) and (302, 177).
; PLAN: r0=440(x1), r1=11(y1), r2=302(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 11
LDI r2, 302
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
