; DESCRIPTION: Draws a purple line from (224, 127) to (359, 235).
; PLAN: r0=224(x1), r1=127(y1), r2=359(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 127
LDI r2, 359
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
