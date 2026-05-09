; DESCRIPTION: Places a green line segment connecting (509, 4) to (240, 238).
; PLAN: r0=509(x1), r1=4(y1), r2=240(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 4
LDI r2, 240
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
