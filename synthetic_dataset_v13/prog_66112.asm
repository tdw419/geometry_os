; DESCRIPTION: Draws a white line from (377, 233) to (187, 134).
; PLAN: r0=377(x1), r1=233(y1), r2=187(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 233
LDI r2, 187
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
