; DESCRIPTION: Draws a green line from (245, 162) to (156, 235).
; PLAN: r0=245(x1), r1=162(y1), r2=156(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 162
LDI r2, 156
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
