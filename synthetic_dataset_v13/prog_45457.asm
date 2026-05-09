; DESCRIPTION: Places a black line segment connecting (32, 224) to (279, 180).
; PLAN: r0=32(x1), r1=224(y1), r2=279(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 224
LDI r2, 279
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
