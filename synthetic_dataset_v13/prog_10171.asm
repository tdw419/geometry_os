; DESCRIPTION: Renders a yellow line between points (442, 234) and (103, 131).
; PLAN: r0=442(x1), r1=234(y1), r2=103(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 234
LDI r2, 103
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
