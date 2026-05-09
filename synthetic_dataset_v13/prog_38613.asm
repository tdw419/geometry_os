; DESCRIPTION: Renders a white line between points (131, 25) and (103, 96).
; PLAN: r0=131(x1), r1=25(y1), r2=103(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 25
LDI r2, 103
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
