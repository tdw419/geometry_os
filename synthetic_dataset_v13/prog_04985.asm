; DESCRIPTION: Draws a red line from (492, 244) to (105, 198).
; PLAN: r0=492(x1), r1=244(y1), r2=105(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 244
LDI r2, 105
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
