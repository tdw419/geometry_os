; DESCRIPTION: Places a red line segment connecting (189, 228) to (244, 80).
; PLAN: r0=189(x1), r1=228(y1), r2=244(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 228
LDI r2, 244
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
