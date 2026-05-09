; DESCRIPTION: Draws a green line from (86, 146) to (261, 4).
; PLAN: r0=86(x1), r1=146(y1), r2=261(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 146
LDI r2, 261
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
