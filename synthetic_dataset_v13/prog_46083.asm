; DESCRIPTION: Places a black line segment connecting (296, 211) to (173, 193).
; PLAN: r0=296(x1), r1=211(y1), r2=173(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 211
LDI r2, 173
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
