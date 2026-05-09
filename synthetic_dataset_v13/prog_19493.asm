; DESCRIPTION: Draws a green line from (327, 8) to (244, 162).
; PLAN: r0=327(x1), r1=8(y1), r2=244(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 8
LDI r2, 244
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
