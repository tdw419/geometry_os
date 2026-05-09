; DESCRIPTION: Places a black line segment connecting (294, 82) to (93, 203).
; PLAN: r0=294(x1), r1=82(y1), r2=93(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 82
LDI r2, 93
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
