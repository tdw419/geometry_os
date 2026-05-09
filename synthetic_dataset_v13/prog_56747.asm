; DESCRIPTION: Draws a white line from (268, 53) to (299, 120).
; PLAN: r0=268(x1), r1=53(y1), r2=299(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 53
LDI r2, 299
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
