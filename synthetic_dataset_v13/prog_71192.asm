; DESCRIPTION: Draws a red line from (318, 224) to (489, 242).
; PLAN: r0=318(x1), r1=224(y1), r2=489(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 224
LDI r2, 489
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
