; DESCRIPTION: Renders a white line between points (99, 12) and (206, 103).
; PLAN: r0=99(x1), r1=12(y1), r2=206(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 12
LDI r2, 206
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
