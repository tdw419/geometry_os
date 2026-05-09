; DESCRIPTION: Draws a white line from (301, 194) to (199, 81).
; PLAN: r0=301(x1), r1=194(y1), r2=199(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 194
LDI r2, 199
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
