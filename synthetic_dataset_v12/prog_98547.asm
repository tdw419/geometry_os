; DESCRIPTION: Places a black line segment connecting (246, 210) to (254, 172).
; PLAN: r0=246(x1), r1=210(y1), r2=254(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 210
LDI r2, 254
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
