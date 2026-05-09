; DESCRIPTION: Renders a white line between points (320, 89) and (60, 219).
; PLAN: r0=320(x1), r1=89(y1), r2=60(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 89
LDI r2, 60
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
