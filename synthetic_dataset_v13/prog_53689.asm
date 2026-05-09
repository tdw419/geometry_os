; DESCRIPTION: Draws a green line from (167, 17) to (339, 46).
; PLAN: r0=167(x1), r1=17(y1), r2=339(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 17
LDI r2, 339
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
