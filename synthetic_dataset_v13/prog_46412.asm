; DESCRIPTION: Renders a white line between points (8, 131) and (320, 200).
; PLAN: r0=8(x1), r1=131(y1), r2=320(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 131
LDI r2, 320
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
