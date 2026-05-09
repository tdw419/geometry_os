; DESCRIPTION: Draws a green line from (357, 40) to (228, 202).
; PLAN: r0=357(x1), r1=40(y1), r2=228(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 40
LDI r2, 228
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
