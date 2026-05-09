; DESCRIPTION: Draws a green line from (46, 244) to (287, 48).
; PLAN: r0=46(x1), r1=244(y1), r2=287(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 244
LDI r2, 287
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
