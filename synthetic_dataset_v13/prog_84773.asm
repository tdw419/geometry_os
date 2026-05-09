; DESCRIPTION: Renders a green line between points (293, 93) and (245, 162).
; PLAN: r0=293(x1), r1=93(y1), r2=245(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 93
LDI r2, 245
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
