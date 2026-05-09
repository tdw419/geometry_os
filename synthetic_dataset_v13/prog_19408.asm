; DESCRIPTION: Draws a green line from (455, 137) to (436, 187).
; PLAN: r0=455(x1), r1=137(y1), r2=436(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 137
LDI r2, 436
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
