; DESCRIPTION: Renders a black line between points (368, 97) and (224, 36).
; PLAN: r0=368(x1), r1=97(y1), r2=224(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 97
LDI r2, 224
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
