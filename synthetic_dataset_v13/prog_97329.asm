; DESCRIPTION: Places a red line segment connecting (365, 224) to (59, 243).
; PLAN: r0=365(x1), r1=224(y1), r2=59(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 224
LDI r2, 59
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
