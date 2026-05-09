; DESCRIPTION: Renders a green line between points (465, 93) and (303, 145).
; PLAN: r0=465(x1), r1=93(y1), r2=303(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 93
LDI r2, 303
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
