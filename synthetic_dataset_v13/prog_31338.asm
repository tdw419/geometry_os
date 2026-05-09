; DESCRIPTION: Draws a yellow line from (45, 4) to (12, 174).
; PLAN: r0=45(x1), r1=4(y1), r2=12(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 4
LDI r2, 12
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
