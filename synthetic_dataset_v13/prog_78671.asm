; DESCRIPTION: Draws a black line from (451, 104) to (224, 253).
; PLAN: r0=451(x1), r1=104(y1), r2=224(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 104
LDI r2, 224
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
