; DESCRIPTION: Places a red line segment connecting (30, 177) to (465, 59).
; PLAN: r0=30(x1), r1=177(y1), r2=465(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 177
LDI r2, 465
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
