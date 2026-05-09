; DESCRIPTION: Places a white line segment connecting (93, 4) to (217, 215).
; PLAN: r0=93(x1), r1=4(y1), r2=217(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 4
LDI r2, 217
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
