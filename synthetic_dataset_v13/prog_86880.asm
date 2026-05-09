; DESCRIPTION: Renders a green line between points (210, 150) and (441, 160).
; PLAN: r0=210(x1), r1=150(y1), r2=441(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 150
LDI r2, 441
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
