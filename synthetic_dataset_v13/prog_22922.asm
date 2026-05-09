; DESCRIPTION: Places a red line segment connecting (174, 228) to (155, 244).
; PLAN: r0=174(x1), r1=228(y1), r2=155(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 228
LDI r2, 155
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
