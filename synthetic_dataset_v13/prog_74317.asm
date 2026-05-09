; DESCRIPTION: Draws a green line from (324, 244) to (290, 244).
; PLAN: r0=324(x1), r1=244(y1), r2=290(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 244
LDI r2, 290
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
