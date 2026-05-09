; DESCRIPTION: Renders a red line between points (442, 130) and (384, 79).
; PLAN: r0=442(x1), r1=130(y1), r2=384(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 130
LDI r2, 384
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
