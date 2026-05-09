; DESCRIPTION: Draws a white line from (244, 76) to (418, 253).
; PLAN: r0=244(x1), r1=76(y1), r2=418(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 76
LDI r2, 418
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
