; DESCRIPTION: Places a black line segment connecting (402, 209) to (53, 242).
; PLAN: r0=402(x1), r1=209(y1), r2=53(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 209
LDI r2, 53
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
