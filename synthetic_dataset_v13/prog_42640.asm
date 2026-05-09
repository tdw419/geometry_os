; DESCRIPTION: Renders a green line between points (154, 203) and (396, 87).
; PLAN: r0=154(x1), r1=203(y1), r2=396(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 203
LDI r2, 396
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
