; DESCRIPTION: Draws a black line from (416, 193) to (170, 37).
; PLAN: r0=416(x1), r1=193(y1), r2=170(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 193
LDI r2, 170
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
