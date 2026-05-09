; DESCRIPTION: Draws a white line from (330, 71) to (164, 205).
; PLAN: r0=330(x1), r1=71(y1), r2=164(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 164
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
