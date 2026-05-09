; DESCRIPTION: Draws a green line from (353, 138) to (150, 150).
; PLAN: r0=353(x1), r1=138(y1), r2=150(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 138
LDI r2, 150
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
