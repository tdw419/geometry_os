; DESCRIPTION: Places a red line segment connecting (257, 91) to (300, 68).
; PLAN: r0=257(x1), r1=91(y1), r2=300(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 91
LDI r2, 300
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
