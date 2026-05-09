; DESCRIPTION: Renders a white line between points (114, 226) and (19, 115).
; PLAN: r0=114(x1), r1=226(y1), r2=19(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 226
LDI r2, 19
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
