; DESCRIPTION: Renders a white line between points (74, 20) and (327, 172).
; PLAN: r0=74(x1), r1=20(y1), r2=327(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 20
LDI r2, 327
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
