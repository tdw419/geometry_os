; DESCRIPTION: Draws a white line from (455, 236) to (130, 121).
; PLAN: r0=455(x1), r1=236(y1), r2=130(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 236
LDI r2, 130
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
