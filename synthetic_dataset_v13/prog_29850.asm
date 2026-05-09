; DESCRIPTION: Draws a white line from (49, 113) to (397, 180).
; PLAN: r0=49(x1), r1=113(y1), r2=397(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 113
LDI r2, 397
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
