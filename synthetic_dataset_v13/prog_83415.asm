; DESCRIPTION: Draws a green line from (375, 244) to (124, 10).
; PLAN: r0=375(x1), r1=244(y1), r2=124(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 244
LDI r2, 124
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
