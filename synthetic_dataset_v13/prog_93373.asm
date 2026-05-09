; DESCRIPTION: Draws a black line from (6, 116) to (435, 224).
; PLAN: r0=6(x1), r1=116(y1), r2=435(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 116
LDI r2, 435
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
