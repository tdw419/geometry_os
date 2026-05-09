; DESCRIPTION: Places a green line segment connecting (265, 254) to (291, 124).
; PLAN: r0=265(x1), r1=254(y1), r2=291(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 254
LDI r2, 291
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
