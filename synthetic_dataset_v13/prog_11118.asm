; DESCRIPTION: Renders a green line between points (221, 55) and (164, 163).
; PLAN: r0=221(x1), r1=55(y1), r2=164(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 55
LDI r2, 164
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
