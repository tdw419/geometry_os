; DESCRIPTION: Renders a cyan line between points (28, 10) and (369, 88).
; PLAN: r0=28(x1), r1=10(y1), r2=369(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 10
LDI r2, 369
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
