; DESCRIPTION: Draws a blue line from (421, 27) to (273, 244).
; PLAN: r0=421(x1), r1=27(y1), r2=273(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 27
LDI r2, 273
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
