; DESCRIPTION: Renders a black line between points (397, 59) and (0, 153).
; PLAN: r0=397(x1), r1=59(y1), r2=0(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 59
LDI r2, 0
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
