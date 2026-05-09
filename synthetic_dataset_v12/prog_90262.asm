; DESCRIPTION: Renders a white line between points (127, 148) and (379, 70).
; PLAN: r0=127(x1), r1=148(y1), r2=379(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 148
LDI r2, 379
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
