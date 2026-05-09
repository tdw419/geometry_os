; DESCRIPTION: Renders a white line between points (442, 28) and (299, 155).
; PLAN: r0=442(x1), r1=28(y1), r2=299(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 28
LDI r2, 299
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
