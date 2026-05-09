; DESCRIPTION: Places a black line segment connecting (173, 115) to (61, 236).
; PLAN: r0=173(x1), r1=115(y1), r2=61(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 115
LDI r2, 61
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
