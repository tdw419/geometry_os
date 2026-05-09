; DESCRIPTION: Places a blue line segment connecting (45, 209) to (53, 231).
; PLAN: r0=45(x1), r1=209(y1), r2=53(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 209
LDI r2, 53
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
