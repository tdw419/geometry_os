; DESCRIPTION: Renders a blue line between points (502, 156) and (236, 170).
; PLAN: r0=502(x1), r1=156(y1), r2=236(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 156
LDI r2, 236
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
