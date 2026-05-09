; DESCRIPTION: Places a black line segment connecting (443, 22) to (257, 221).
; PLAN: r0=443(x1), r1=22(y1), r2=257(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 22
LDI r2, 257
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
