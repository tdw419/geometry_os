; DESCRIPTION: Draws a green line from (507, 251) to (222, 113).
; PLAN: r0=507(x1), r1=251(y1), r2=222(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 251
LDI r2, 222
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
