; DESCRIPTION: Draws a green line from (300, 30) to (156, 60).
; PLAN: r0=300(x1), r1=30(y1), r2=156(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 30
LDI r2, 156
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
