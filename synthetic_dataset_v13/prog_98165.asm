; DESCRIPTION: Renders a yellow line between points (215, 203) and (408, 45).
; PLAN: r0=215(x1), r1=203(y1), r2=408(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 203
LDI r2, 408
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
