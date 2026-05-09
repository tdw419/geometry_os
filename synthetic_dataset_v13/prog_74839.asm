; DESCRIPTION: Renders a white line between points (70, 40) and (77, 32).
; PLAN: r0=70(x1), r1=40(y1), r2=77(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 40
LDI r2, 77
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
