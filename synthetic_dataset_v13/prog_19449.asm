; DESCRIPTION: Places a black line segment connecting (57, 0) to (480, 255).
; PLAN: r0=57(x1), r1=0(y1), r2=480(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 0
LDI r2, 480
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
