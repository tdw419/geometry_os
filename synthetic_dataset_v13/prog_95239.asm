; DESCRIPTION: Draws a white line from (456, 196) to (106, 230).
; PLAN: r0=456(x1), r1=196(y1), r2=106(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 196
LDI r2, 106
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
