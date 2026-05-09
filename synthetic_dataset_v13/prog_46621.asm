; DESCRIPTION: Draws a black line from (150, 48) to (452, 198).
; PLAN: r0=150(x1), r1=48(y1), r2=452(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 48
LDI r2, 452
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
