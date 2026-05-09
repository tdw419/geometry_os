; DESCRIPTION: Draws a blue line from (26, 239) to (44, 68).
; PLAN: r0=26(x1), r1=239(y1), r2=44(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 239
LDI r2, 44
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
