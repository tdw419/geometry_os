; DESCRIPTION: Renders a white line between points (297, 146) and (256, 100).
; PLAN: r0=297(x1), r1=146(y1), r2=256(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 146
LDI r2, 256
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
