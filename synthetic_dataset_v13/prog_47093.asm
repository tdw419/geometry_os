; DESCRIPTION: Renders a green line between points (77, 3) and (480, 93).
; PLAN: r0=77(x1), r1=3(y1), r2=480(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 3
LDI r2, 480
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
