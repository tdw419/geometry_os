; DESCRIPTION: Draws a green line from (370, 34) to (112, 171).
; PLAN: r0=370(x1), r1=34(y1), r2=112(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 34
LDI r2, 112
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
