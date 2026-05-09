; DESCRIPTION: Renders a blue line between points (418, 138) and (307, 239).
; PLAN: r0=418(x1), r1=138(y1), r2=307(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 138
LDI r2, 307
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
