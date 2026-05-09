; DESCRIPTION: Places a blue line segment connecting (262, 166) to (509, 244).
; PLAN: r0=262(x1), r1=166(y1), r2=509(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 166
LDI r2, 509
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
