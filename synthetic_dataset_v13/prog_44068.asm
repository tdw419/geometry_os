; DESCRIPTION: Draws a orange line from (161, 207) to (284, 188).
; PLAN: r0=161(x1), r1=207(y1), r2=284(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 207
LDI r2, 284
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
