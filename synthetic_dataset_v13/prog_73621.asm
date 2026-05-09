; DESCRIPTION: Renders a blue line between points (344, 82) and (281, 102).
; PLAN: r0=344(x1), r1=82(y1), r2=281(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 82
LDI r2, 281
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
