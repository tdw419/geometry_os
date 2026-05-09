; DESCRIPTION: Places a white line segment connecting (74, 189) to (75, 182).
; PLAN: r0=74(x1), r1=189(y1), r2=75(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 189
LDI r2, 75
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
