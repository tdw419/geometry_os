; DESCRIPTION: Places a green line segment connecting (92, 237) to (383, 92).
; PLAN: r0=92(x1), r1=237(y1), r2=383(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 237
LDI r2, 383
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
