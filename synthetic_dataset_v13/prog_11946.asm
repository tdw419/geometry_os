; DESCRIPTION: Places a black line segment connecting (249, 146) to (429, 208).
; PLAN: r0=249(x1), r1=146(y1), r2=429(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 146
LDI r2, 429
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
