; DESCRIPTION: Places a magenta line segment connecting (58, 193) to (356, 195).
; PLAN: r0=58(x1), r1=193(y1), r2=356(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 193
LDI r2, 356
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
