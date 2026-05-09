; DESCRIPTION: Places a black line segment connecting (265, 229) to (138, 182).
; PLAN: r0=265(x1), r1=229(y1), r2=138(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 229
LDI r2, 138
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
