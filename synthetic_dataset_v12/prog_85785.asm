; DESCRIPTION: Draws a blue line from (303, 55) to (269, 86).
; PLAN: r0=303(x1), r1=55(y1), r2=269(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 55
LDI r2, 269
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
