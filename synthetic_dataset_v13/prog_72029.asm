; DESCRIPTION: Draws a yellow line from (507, 205) to (292, 198).
; PLAN: r0=507(x1), r1=205(y1), r2=292(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 205
LDI r2, 292
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
