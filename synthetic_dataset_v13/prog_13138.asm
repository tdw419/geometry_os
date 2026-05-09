; DESCRIPTION: Renders a white line between points (280, 139) and (434, 118).
; PLAN: r0=280(x1), r1=139(y1), r2=434(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 139
LDI r2, 434
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
