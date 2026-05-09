; DESCRIPTION: Renders a green line between points (495, 57) and (7, 180).
; PLAN: r0=495(x1), r1=57(y1), r2=7(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 57
LDI r2, 7
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
