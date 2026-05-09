; DESCRIPTION: Renders a green line between points (367, 24) and (468, 26).
; PLAN: r0=367(x1), r1=24(y1), r2=468(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 24
LDI r2, 468
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
