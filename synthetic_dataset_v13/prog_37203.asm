; DESCRIPTION: Draws a green line from (482, 161) to (171, 105).
; PLAN: r0=482(x1), r1=161(y1), r2=171(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 161
LDI r2, 171
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
