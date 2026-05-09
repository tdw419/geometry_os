; DESCRIPTION: Draws a yellow line from (72, 31) to (492, 220).
; PLAN: r0=72(x1), r1=31(y1), r2=492(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 31
LDI r2, 492
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
