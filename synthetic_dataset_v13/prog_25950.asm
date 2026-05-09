; DESCRIPTION: Renders a green line between points (365, 156) and (420, 240).
; PLAN: r0=365(x1), r1=156(y1), r2=420(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 156
LDI r2, 420
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
