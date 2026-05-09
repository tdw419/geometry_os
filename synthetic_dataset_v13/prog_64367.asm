; DESCRIPTION: Places a blue line segment connecting (475, 27) to (367, 167).
; PLAN: r0=475(x1), r1=27(y1), r2=367(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 27
LDI r2, 367
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
