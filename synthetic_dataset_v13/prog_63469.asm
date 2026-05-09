; DESCRIPTION: Draws a black line from (303, 172) to (63, 253).
; PLAN: r0=303(x1), r1=172(y1), r2=63(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 172
LDI r2, 63
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
