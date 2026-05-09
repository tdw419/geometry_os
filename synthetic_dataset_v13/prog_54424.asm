; DESCRIPTION: Draws a purple line from (346, 163) to (92, 184).
; PLAN: r0=346(x1), r1=163(y1), r2=92(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 163
LDI r2, 92
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
