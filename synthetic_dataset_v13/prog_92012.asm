; DESCRIPTION: Draws a red line from (74, 194) to (265, 254).
; PLAN: r0=74(x1), r1=194(y1), r2=265(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 194
LDI r2, 265
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
