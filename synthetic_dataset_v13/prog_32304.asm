; DESCRIPTION: Renders a purple line between points (92, 222) and (387, 50).
; PLAN: r0=92(x1), r1=222(y1), r2=387(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 222
LDI r2, 387
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
