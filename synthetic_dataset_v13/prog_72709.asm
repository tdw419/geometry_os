; DESCRIPTION: Places a red line segment connecting (30, 3) to (206, 187).
; PLAN: r0=30(x1), r1=3(y1), r2=206(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 3
LDI r2, 206
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
