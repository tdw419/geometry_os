; DESCRIPTION: Renders a white line between points (102, 146) and (32, 197).
; PLAN: r0=102(x1), r1=146(y1), r2=32(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 146
LDI r2, 32
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
