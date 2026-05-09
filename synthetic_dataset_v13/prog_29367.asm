; DESCRIPTION: Places a black line segment connecting (434, 240) to (411, 180).
; PLAN: r0=434(x1), r1=240(y1), r2=411(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 240
LDI r2, 411
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
