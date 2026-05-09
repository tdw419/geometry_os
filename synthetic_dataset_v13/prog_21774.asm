; DESCRIPTION: Places a black line segment connecting (289, 113) to (326, 204).
; PLAN: r0=289(x1), r1=113(y1), r2=326(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 113
LDI r2, 326
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
