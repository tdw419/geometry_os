; DESCRIPTION: Draws a black line from (258, 107) to (487, 189).
; PLAN: r0=258(x1), r1=107(y1), r2=487(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 107
LDI r2, 487
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
