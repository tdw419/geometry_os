; DESCRIPTION: Draws a white line from (256, 74) to (157, 241).
; PLAN: r0=256(x1), r1=74(y1), r2=157(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 74
LDI r2, 157
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
