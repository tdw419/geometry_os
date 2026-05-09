; DESCRIPTION: Draws a blue line from (303, 252) to (42, 102).
; PLAN: r0=303(x1), r1=252(y1), r2=42(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 252
LDI r2, 42
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
