; DESCRIPTION: Draws a green line from (336, 69) to (370, 165).
; PLAN: r0=336(x1), r1=69(y1), r2=370(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 69
LDI r2, 370
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
