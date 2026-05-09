; DESCRIPTION: Draws a white line from (215, 220) to (489, 148).
; PLAN: r0=215(x1), r1=220(y1), r2=489(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 220
LDI r2, 489
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
