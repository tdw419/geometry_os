; DESCRIPTION: Places a black line segment connecting (0, 202) to (330, 214).
; PLAN: r0=0(x1), r1=202(y1), r2=330(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 202
LDI r2, 330
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
