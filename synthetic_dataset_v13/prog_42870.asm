; DESCRIPTION: Draws a purple line from (393, 255) to (497, 239).
; PLAN: r0=393(x1), r1=255(y1), r2=497(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 255
LDI r2, 497
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
