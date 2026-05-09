; DESCRIPTION: Renders a white line between points (150, 97) and (262, 131).
; PLAN: r0=150(x1), r1=97(y1), r2=262(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 97
LDI r2, 262
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
