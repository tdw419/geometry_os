; DESCRIPTION: Places a blue line segment connecting (309, 5) to (215, 37).
; PLAN: r0=309(x1), r1=5(y1), r2=215(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 5
LDI r2, 215
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
