; DESCRIPTION: Draws a yellow line from (434, 116) to (271, 235).
; PLAN: r0=434(x1), r1=116(y1), r2=271(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 116
LDI r2, 271
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
