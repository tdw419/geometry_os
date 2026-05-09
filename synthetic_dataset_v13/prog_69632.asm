; DESCRIPTION: Places a black line segment connecting (330, 46) to (178, 51).
; PLAN: r0=330(x1), r1=46(y1), r2=178(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 46
LDI r2, 178
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
