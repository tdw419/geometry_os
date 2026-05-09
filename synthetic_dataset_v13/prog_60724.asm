; DESCRIPTION: Renders a white line between points (215, 118) and (96, 31).
; PLAN: r0=215(x1), r1=118(y1), r2=96(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 118
LDI r2, 96
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
