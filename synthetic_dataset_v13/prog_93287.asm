; DESCRIPTION: Draws a green line from (384, 150) to (214, 110).
; PLAN: r0=384(x1), r1=150(y1), r2=214(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 150
LDI r2, 214
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
