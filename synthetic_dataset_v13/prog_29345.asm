; DESCRIPTION: Renders a white line between points (220, 137) and (153, 171).
; PLAN: r0=220(x1), r1=137(y1), r2=153(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 137
LDI r2, 153
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
