; DESCRIPTION: Places a black line segment connecting (510, 39) to (71, 214).
; PLAN: r0=510(x1), r1=39(y1), r2=71(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 39
LDI r2, 71
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
