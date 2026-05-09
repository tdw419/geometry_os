; DESCRIPTION: Draws a purple line from (226, 221) to (294, 235).
; PLAN: r0=226(x1), r1=221(y1), r2=294(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 221
LDI r2, 294
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
