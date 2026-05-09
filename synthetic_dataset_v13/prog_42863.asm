; DESCRIPTION: Draws a green line from (356, 28) to (426, 159).
; PLAN: r0=356(x1), r1=28(y1), r2=426(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 28
LDI r2, 426
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
