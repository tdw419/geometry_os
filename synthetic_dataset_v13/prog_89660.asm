; DESCRIPTION: Places a blue line segment connecting (113, 193) to (48, 253).
; PLAN: r0=113(x1), r1=193(y1), r2=48(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 193
LDI r2, 48
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
