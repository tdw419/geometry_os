; DESCRIPTION: Places a white line segment connecting (237, 130) to (278, 48).
; PLAN: r0=237(x1), r1=130(y1), r2=278(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 130
LDI r2, 278
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
