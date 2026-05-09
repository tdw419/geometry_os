; DESCRIPTION: Places a black line segment connecting (264, 75) to (32, 173).
; PLAN: r0=264(x1), r1=75(y1), r2=32(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 75
LDI r2, 32
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
