; DESCRIPTION: Renders a green line between points (305, 79) and (163, 161).
; PLAN: r0=305(x1), r1=79(y1), r2=163(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 79
LDI r2, 163
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
