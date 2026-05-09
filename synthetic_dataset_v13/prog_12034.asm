; DESCRIPTION: Renders a red line between points (143, 196) and (293, 69).
; PLAN: r0=143(x1), r1=196(y1), r2=293(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 196
LDI r2, 293
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
