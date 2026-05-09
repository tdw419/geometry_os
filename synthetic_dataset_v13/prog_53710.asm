; DESCRIPTION: Places a red line segment connecting (224, 236) to (190, 253).
; PLAN: r0=224(x1), r1=236(y1), r2=190(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 236
LDI r2, 190
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
