; DESCRIPTION: Renders a blue line between points (198, 90) and (293, 117).
; PLAN: r0=198(x1), r1=90(y1), r2=293(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 90
LDI r2, 293
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
