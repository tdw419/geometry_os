; DESCRIPTION: Renders a white line between points (510, 75) and (340, 238).
; PLAN: r0=510(x1), r1=75(y1), r2=340(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 75
LDI r2, 340
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
