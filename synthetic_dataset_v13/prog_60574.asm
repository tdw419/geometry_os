; DESCRIPTION: Renders a green line between points (343, 10) and (435, 210).
; PLAN: r0=343(x1), r1=10(y1), r2=435(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 10
LDI r2, 435
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
