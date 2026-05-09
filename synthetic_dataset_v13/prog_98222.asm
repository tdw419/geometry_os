; DESCRIPTION: Places a red line segment connecting (245, 235) to (272, 186).
; PLAN: r0=245(x1), r1=235(y1), r2=272(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 235
LDI r2, 272
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
