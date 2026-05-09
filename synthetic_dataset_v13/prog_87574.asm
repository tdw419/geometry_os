; DESCRIPTION: Draws a black line from (445, 171) to (325, 114).
; PLAN: r0=445(x1), r1=171(y1), r2=325(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 171
LDI r2, 325
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
