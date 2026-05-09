; DESCRIPTION: Renders a black line between points (344, 79) and (357, 166).
; PLAN: r0=344(x1), r1=79(y1), r2=357(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 79
LDI r2, 357
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
