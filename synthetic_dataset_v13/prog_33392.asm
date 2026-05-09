; DESCRIPTION: Renders a green line between points (142, 150) and (406, 39).
; PLAN: r0=142(x1), r1=150(y1), r2=406(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 150
LDI r2, 406
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
