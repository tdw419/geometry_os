; DESCRIPTION: Renders a black line between points (193, 210) and (406, 7).
; PLAN: r0=193(x1), r1=210(y1), r2=406(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 210
LDI r2, 406
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
