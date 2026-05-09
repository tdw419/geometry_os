; DESCRIPTION: Renders a white line between points (249, 210) and (423, 39).
; PLAN: r0=249(x1), r1=210(y1), r2=423(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 210
LDI r2, 423
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
