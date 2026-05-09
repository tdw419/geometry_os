; DESCRIPTION: Places a black line segment connecting (146, 1) to (509, 141).
; PLAN: r0=146(x1), r1=1(y1), r2=509(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 1
LDI r2, 509
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
