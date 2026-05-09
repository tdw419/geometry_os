; DESCRIPTION: Draws a red line from (384, 149) to (61, 199).
; PLAN: r0=384(x1), r1=149(y1), r2=61(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 149
LDI r2, 61
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
