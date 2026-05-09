; DESCRIPTION: Places a red line segment connecting (235, 108) to (226, 254).
; PLAN: r0=235(x1), r1=108(y1), r2=226(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 108
LDI r2, 226
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
