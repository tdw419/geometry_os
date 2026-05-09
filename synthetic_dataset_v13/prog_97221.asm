; DESCRIPTION: Renders a white line between points (320, 199) and (16, 109).
; PLAN: r0=320(x1), r1=199(y1), r2=16(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 199
LDI r2, 16
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
