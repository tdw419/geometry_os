; DESCRIPTION: Draws a cyan line from (58, 17) to (357, 161).
; PLAN: r0=58(x1), r1=17(y1), r2=357(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 17
LDI r2, 357
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
