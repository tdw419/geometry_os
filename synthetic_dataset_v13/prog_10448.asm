; DESCRIPTION: Draws a white line from (39, 224) to (93, 160).
; PLAN: r0=39(x1), r1=224(y1), r2=93(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 224
LDI r2, 93
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
