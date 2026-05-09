; DESCRIPTION: Places a red line segment connecting (330, 207) to (150, 24).
; PLAN: r0=330(x1), r1=207(y1), r2=150(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 207
LDI r2, 150
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
