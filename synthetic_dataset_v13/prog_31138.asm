; DESCRIPTION: Renders a white line between points (282, 12) and (418, 168).
; PLAN: r0=282(x1), r1=12(y1), r2=418(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 12
LDI r2, 418
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
