; DESCRIPTION: Renders a white line between points (304, 8) and (120, 132).
; PLAN: r0=304(x1), r1=8(y1), r2=120(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 8
LDI r2, 120
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
