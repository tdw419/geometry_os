; DESCRIPTION: Draws a blue line from (507, 249) to (409, 166).
; PLAN: r0=507(x1), r1=249(y1), r2=409(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 249
LDI r2, 409
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
