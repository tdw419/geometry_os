; DESCRIPTION: Draws a red line from (19, 54) to (509, 206).
; PLAN: r0=19(x1), r1=54(y1), r2=509(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 54
LDI r2, 509
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
