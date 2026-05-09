; DESCRIPTION: Draws a blue line from (364, 12) to (255, 203).
; PLAN: r0=364(x1), r1=12(y1), r2=255(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 12
LDI r2, 255
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
