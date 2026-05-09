; DESCRIPTION: Renders a blue line between points (398, 116) and (356, 5).
; PLAN: r0=398(x1), r1=116(y1), r2=356(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 116
LDI r2, 356
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
