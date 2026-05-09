; DESCRIPTION: Draws a black line from (234, 107) to (297, 26).
; PLAN: r0=234(x1), r1=107(y1), r2=297(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 107
LDI r2, 297
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
