; DESCRIPTION: Renders a yellow line between points (217, 5) and (112, 117).
; PLAN: r0=217(x1), r1=5(y1), r2=112(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 5
LDI r2, 112
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
