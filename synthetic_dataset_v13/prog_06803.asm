; DESCRIPTION: Draws a white line from (350, 186) to (28, 71).
; PLAN: r0=350(x1), r1=186(y1), r2=28(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 186
LDI r2, 28
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
