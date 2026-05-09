; DESCRIPTION: Renders a green line between points (369, 47) and (365, 195).
; PLAN: r0=369(x1), r1=47(y1), r2=365(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 47
LDI r2, 365
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
