; DESCRIPTION: Draws a white line from (384, 229) to (302, 37).
; PLAN: r0=384(x1), r1=229(y1), r2=302(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 229
LDI r2, 302
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
