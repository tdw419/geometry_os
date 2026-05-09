; DESCRIPTION: Places a white line segment connecting (179, 20) to (268, 107).
; PLAN: r0=179(x1), r1=20(y1), r2=268(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 20
LDI r2, 268
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
