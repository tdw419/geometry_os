; DESCRIPTION: Places a yellow line segment connecting (41, 200) to (120, 228).
; PLAN: r0=41(x1), r1=200(y1), r2=120(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 200
LDI r2, 120
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
