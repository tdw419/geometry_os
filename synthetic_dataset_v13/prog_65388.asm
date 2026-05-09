; DESCRIPTION: Renders a white line between points (481, 241) and (60, 21).
; PLAN: r0=481(x1), r1=241(y1), r2=60(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 241
LDI r2, 60
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
