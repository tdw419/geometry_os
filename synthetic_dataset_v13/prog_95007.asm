; DESCRIPTION: Renders a white line between points (300, 237) and (344, 18).
; PLAN: r0=300(x1), r1=237(y1), r2=344(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 237
LDI r2, 344
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
