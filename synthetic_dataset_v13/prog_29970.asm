; DESCRIPTION: Draws a white line from (414, 176) to (50, 102).
; PLAN: r0=414(x1), r1=176(y1), r2=50(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 176
LDI r2, 50
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
