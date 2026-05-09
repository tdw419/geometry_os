; DESCRIPTION: Renders a blue line between points (280, 200) and (487, 108).
; PLAN: r0=280(x1), r1=200(y1), r2=487(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 200
LDI r2, 487
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
