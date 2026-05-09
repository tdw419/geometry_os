; DESCRIPTION: Places a blue line segment connecting (434, 103) to (195, 53).
; PLAN: r0=434(x1), r1=103(y1), r2=195(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 103
LDI r2, 195
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
