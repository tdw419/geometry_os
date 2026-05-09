; DESCRIPTION: Renders a green line between points (198, 45) and (82, 185).
; PLAN: r0=198(x1), r1=45(y1), r2=82(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 45
LDI r2, 82
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
