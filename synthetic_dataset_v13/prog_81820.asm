; DESCRIPTION: Renders a white line between points (246, 69) and (249, 196).
; PLAN: r0=246(x1), r1=69(y1), r2=249(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 69
LDI r2, 249
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
