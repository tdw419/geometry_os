; DESCRIPTION: Places a black line segment connecting (320, 69) to (27, 130).
; PLAN: r0=320(x1), r1=69(y1), r2=27(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 69
LDI r2, 27
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
