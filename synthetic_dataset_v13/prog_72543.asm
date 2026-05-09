; DESCRIPTION: Draws a red line from (114, 150) to (505, 234).
; PLAN: r0=114(x1), r1=150(y1), r2=505(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 150
LDI r2, 505
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
