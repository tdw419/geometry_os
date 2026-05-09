; DESCRIPTION: Draws a green line from (88, 157) to (214, 50).
; PLAN: r0=88(x1), r1=157(y1), r2=214(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 157
LDI r2, 214
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
