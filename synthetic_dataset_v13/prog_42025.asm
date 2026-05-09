; DESCRIPTION: Places a cyan line segment connecting (293, 49) to (476, 206).
; PLAN: r0=293(x1), r1=49(y1), r2=476(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 49
LDI r2, 476
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
