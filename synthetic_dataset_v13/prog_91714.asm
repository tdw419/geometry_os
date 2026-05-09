; DESCRIPTION: Draws a black line from (452, 197) to (504, 253).
; PLAN: r0=452(x1), r1=197(y1), r2=504(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 197
LDI r2, 504
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
