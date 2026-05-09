; DESCRIPTION: Places a black line segment connecting (96, 32) to (385, 107).
; PLAN: r0=96(x1), r1=32(y1), r2=385(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 32
LDI r2, 385
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
