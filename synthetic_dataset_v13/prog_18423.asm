; DESCRIPTION: Places a red line segment connecting (209, 202) to (246, 149).
; PLAN: r0=209(x1), r1=202(y1), r2=246(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 202
LDI r2, 246
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
