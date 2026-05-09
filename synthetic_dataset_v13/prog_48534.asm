; DESCRIPTION: Renders a blue line between points (480, 203) and (202, 196).
; PLAN: r0=480(x1), r1=203(y1), r2=202(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 203
LDI r2, 202
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
