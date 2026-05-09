; DESCRIPTION: Renders a white line between points (247, 175) and (60, 197).
; PLAN: r0=247(x1), r1=175(y1), r2=60(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 175
LDI r2, 60
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
