; DESCRIPTION: Renders a white line between points (277, 218) and (74, 172).
; PLAN: r0=277(x1), r1=218(y1), r2=74(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 218
LDI r2, 74
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
