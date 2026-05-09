; DESCRIPTION: Renders a blue line between points (240, 189) and (203, 42).
; PLAN: r0=240(x1), r1=189(y1), r2=203(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 189
LDI r2, 203
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
