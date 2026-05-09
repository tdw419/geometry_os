; DESCRIPTION: Renders a blue line between points (444, 130) and (450, 95).
; PLAN: r0=444(x1), r1=130(y1), r2=450(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 130
LDI r2, 450
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
