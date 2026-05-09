; DESCRIPTION: Places a green line segment connecting (332, 238) to (450, 127).
; PLAN: r0=332(x1), r1=238(y1), r2=450(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 238
LDI r2, 450
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
