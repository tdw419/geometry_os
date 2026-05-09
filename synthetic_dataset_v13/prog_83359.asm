; DESCRIPTION: Renders a green line between points (392, 144) and (238, 203).
; PLAN: r0=392(x1), r1=144(y1), r2=238(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 144
LDI r2, 238
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
