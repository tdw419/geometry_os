; DESCRIPTION: Draws a yellow line from (271, 46) to (286, 108).
; PLAN: r0=271(x1), r1=46(y1), r2=286(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 46
LDI r2, 286
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
