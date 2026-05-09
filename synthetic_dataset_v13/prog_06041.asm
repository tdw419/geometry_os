; DESCRIPTION: Places a black line segment connecting (256, 21) to (465, 4).
; PLAN: r0=256(x1), r1=21(y1), r2=465(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 21
LDI r2, 465
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
