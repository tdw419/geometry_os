; DESCRIPTION: Places a white line segment connecting (74, 133) to (309, 81).
; PLAN: r0=74(x1), r1=133(y1), r2=309(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 133
LDI r2, 309
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
