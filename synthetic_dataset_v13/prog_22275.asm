; DESCRIPTION: Draws a green line from (163, 165) to (324, 113).
; PLAN: r0=163(x1), r1=165(y1), r2=324(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 165
LDI r2, 324
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
