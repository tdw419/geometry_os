; DESCRIPTION: Draws a black line from (476, 16) to (44, 242).
; PLAN: r0=476(x1), r1=16(y1), r2=44(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 16
LDI r2, 44
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
