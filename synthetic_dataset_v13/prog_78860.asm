; DESCRIPTION: Renders a white line between points (164, 233) and (255, 136).
; PLAN: r0=164(x1), r1=233(y1), r2=255(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 233
LDI r2, 255
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
