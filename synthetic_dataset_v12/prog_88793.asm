; DESCRIPTION: Places a black line segment connecting (57, 95) to (135, 32).
; PLAN: r0=57(x1), r1=95(y1), r2=135(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 95
LDI r2, 135
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
