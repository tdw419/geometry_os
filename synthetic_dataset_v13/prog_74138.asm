; DESCRIPTION: Renders a white line between points (238, 194) and (179, 146).
; PLAN: r0=238(x1), r1=194(y1), r2=179(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 194
LDI r2, 179
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
