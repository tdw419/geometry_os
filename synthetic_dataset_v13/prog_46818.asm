; DESCRIPTION: Renders a green line between points (83, 120) and (293, 187).
; PLAN: r0=83(x1), r1=120(y1), r2=293(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 120
LDI r2, 293
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
