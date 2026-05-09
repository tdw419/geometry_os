; DESCRIPTION: Draws a red line from (251, 38) to (384, 126).
; PLAN: r0=251(x1), r1=38(y1), r2=384(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 38
LDI r2, 384
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
