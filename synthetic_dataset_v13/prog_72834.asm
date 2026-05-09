; DESCRIPTION: Renders a green line between points (82, 28) and (476, 200).
; PLAN: r0=82(x1), r1=28(y1), r2=476(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 28
LDI r2, 476
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
