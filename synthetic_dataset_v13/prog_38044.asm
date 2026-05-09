; DESCRIPTION: Places a white line segment connecting (48, 44) to (345, 224).
; PLAN: r0=48(x1), r1=44(y1), r2=345(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 44
LDI r2, 345
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
