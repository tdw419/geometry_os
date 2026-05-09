; DESCRIPTION: Draws a green line from (116, 37) to (426, 109).
; PLAN: r0=116(x1), r1=37(y1), r2=426(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 37
LDI r2, 426
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
