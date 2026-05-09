; DESCRIPTION: Renders a green line between points (392, 115) and (474, 106).
; PLAN: r0=392(x1), r1=115(y1), r2=474(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 115
LDI r2, 474
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
