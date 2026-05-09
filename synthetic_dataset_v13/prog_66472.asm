; DESCRIPTION: Draws a green line from (160, 31) to (112, 12).
; PLAN: r0=160(x1), r1=31(y1), r2=112(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 31
LDI r2, 112
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
