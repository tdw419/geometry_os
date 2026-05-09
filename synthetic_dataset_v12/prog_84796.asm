; DESCRIPTION: Renders a white line between points (28, 141) and (333, 97).
; PLAN: r0=28(x1), r1=141(y1), r2=333(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 141
LDI r2, 333
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
