; DESCRIPTION: Places a green line segment connecting (160, 134) to (43, 172).
; PLAN: r0=160(x1), r1=134(y1), r2=43(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 134
LDI r2, 43
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
