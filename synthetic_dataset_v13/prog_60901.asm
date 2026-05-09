; DESCRIPTION: Draws a purple line from (320, 19) to (235, 95).
; PLAN: r0=320(x1), r1=19(y1), r2=235(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 19
LDI r2, 235
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
