; DESCRIPTION: Places a red line segment connecting (96, 169) to (394, 113).
; PLAN: r0=96(x1), r1=169(y1), r2=394(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 169
LDI r2, 394
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
