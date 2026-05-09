; DESCRIPTION: Draws a black line from (154, 247) to (122, 178).
; PLAN: r0=154(x1), r1=247(y1), r2=122(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 247
LDI r2, 122
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
