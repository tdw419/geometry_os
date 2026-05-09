; DESCRIPTION: Draws a purple line from (474, 249) to (276, 152).
; PLAN: r0=474(x1), r1=249(y1), r2=276(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 249
LDI r2, 276
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
