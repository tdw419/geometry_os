; DESCRIPTION: Renders a white line between points (175, 193) and (280, 133).
; PLAN: r0=175(x1), r1=193(y1), r2=280(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 193
LDI r2, 280
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
