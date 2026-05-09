; DESCRIPTION: Places a blue line segment connecting (73, 239) to (372, 253).
; PLAN: r0=73(x1), r1=239(y1), r2=372(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 239
LDI r2, 372
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
