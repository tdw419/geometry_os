; DESCRIPTION: Places a red line segment connecting (146, 135) to (150, 232).
; PLAN: r0=146(x1), r1=135(y1), r2=150(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 135
LDI r2, 150
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
