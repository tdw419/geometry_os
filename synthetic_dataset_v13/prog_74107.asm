; DESCRIPTION: Places a white line segment connecting (74, 42) to (178, 106).
; PLAN: r0=74(x1), r1=42(y1), r2=178(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 42
LDI r2, 178
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
