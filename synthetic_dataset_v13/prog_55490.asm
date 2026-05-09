; DESCRIPTION: Renders a cyan line between points (400, 2) and (293, 145).
; PLAN: r0=400(x1), r1=2(y1), r2=293(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 2
LDI r2, 293
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
