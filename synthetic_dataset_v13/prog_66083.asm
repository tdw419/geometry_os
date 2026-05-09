; DESCRIPTION: Renders a white line between points (440, 133) and (244, 196).
; PLAN: r0=440(x1), r1=133(y1), r2=244(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 133
LDI r2, 244
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
