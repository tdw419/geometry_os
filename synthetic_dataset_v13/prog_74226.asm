; DESCRIPTION: Draws a yellow line from (492, 33) to (44, 21).
; PLAN: r0=492(x1), r1=33(y1), r2=44(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 33
LDI r2, 44
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
