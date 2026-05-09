; DESCRIPTION: Draws a white line from (510, 219) to (397, 228).
; PLAN: r0=510(x1), r1=219(y1), r2=397(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 219
LDI r2, 397
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
