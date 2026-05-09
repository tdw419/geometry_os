; DESCRIPTION: Draws a red line from (116, 72) to (242, 235).
; PLAN: r0=116(x1), r1=72(y1), r2=242(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 72
LDI r2, 242
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
