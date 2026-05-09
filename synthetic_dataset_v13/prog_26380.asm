; DESCRIPTION: Draws a yellow line from (91, 152) to (478, 108).
; PLAN: r0=91(x1), r1=152(y1), r2=478(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 152
LDI r2, 478
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
