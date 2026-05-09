; DESCRIPTION: Renders a black line between points (207, 64) and (459, 193).
; PLAN: r0=207(x1), r1=64(y1), r2=459(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 64
LDI r2, 459
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
