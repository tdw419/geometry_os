; DESCRIPTION: Places a blue line segment connecting (391, 168) to (330, 48).
; PLAN: r0=391(x1), r1=168(y1), r2=330(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 168
LDI r2, 330
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
