; DESCRIPTION: Places a black line segment connecting (346, 145) to (397, 186).
; PLAN: r0=346(x1), r1=145(y1), r2=397(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 145
LDI r2, 397
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
