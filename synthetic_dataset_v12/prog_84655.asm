; DESCRIPTION: Places a black line segment connecting (449, 239) to (227, 213).
; PLAN: r0=449(x1), r1=239(y1), r2=227(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 239
LDI r2, 227
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
