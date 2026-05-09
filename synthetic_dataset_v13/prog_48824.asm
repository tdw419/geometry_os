; DESCRIPTION: Places a black line segment connecting (206, 245) to (265, 221).
; PLAN: r0=206(x1), r1=245(y1), r2=265(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 245
LDI r2, 265
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
