; DESCRIPTION: Places a black line segment connecting (82, 107) to (142, 115).
; PLAN: r0=82(x1), r1=107(y1), r2=142(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 107
LDI r2, 142
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
