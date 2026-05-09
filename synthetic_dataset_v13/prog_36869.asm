; DESCRIPTION: Places a blue line segment connecting (485, 93) to (309, 87).
; PLAN: r0=485(x1), r1=93(y1), r2=309(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 93
LDI r2, 309
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
