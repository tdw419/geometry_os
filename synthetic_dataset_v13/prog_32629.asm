; DESCRIPTION: Places a yellow line segment connecting (509, 120) to (465, 252).
; PLAN: r0=509(x1), r1=120(y1), r2=465(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 120
LDI r2, 465
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
