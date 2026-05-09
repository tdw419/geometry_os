; DESCRIPTION: Draws a green line from (3, 206) to (266, 43).
; PLAN: r0=3(x1), r1=206(y1), r2=266(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 206
LDI r2, 266
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
