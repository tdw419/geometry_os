; DESCRIPTION: Places a blue line segment connecting (368, 234) to (42, 254).
; PLAN: r0=368(x1), r1=234(y1), r2=42(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 234
LDI r2, 42
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
