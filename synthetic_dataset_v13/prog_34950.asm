; DESCRIPTION: Renders a green line between points (393, 20) and (371, 199).
; PLAN: r0=393(x1), r1=20(y1), r2=371(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 20
LDI r2, 371
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
