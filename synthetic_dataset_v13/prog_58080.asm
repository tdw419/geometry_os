; DESCRIPTION: Draws a black line from (474, 137) to (224, 60).
; PLAN: r0=474(x1), r1=137(y1), r2=224(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 137
LDI r2, 224
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
