; DESCRIPTION: Renders a black line between points (28, 121) and (313, 153).
; PLAN: r0=28(x1), r1=121(y1), r2=313(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 121
LDI r2, 313
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
