; DESCRIPTION: Renders a white line between points (70, 193) and (61, 250).
; PLAN: r0=70(x1), r1=193(y1), r2=61(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 193
LDI r2, 61
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
