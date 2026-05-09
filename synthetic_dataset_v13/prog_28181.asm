; DESCRIPTION: Draws a purple line from (394, 69) to (420, 59).
; PLAN: r0=394(x1), r1=69(y1), r2=420(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 69
LDI r2, 420
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
