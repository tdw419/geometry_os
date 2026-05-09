; DESCRIPTION: Draws a black line from (452, 129) to (60, 91).
; PLAN: r0=452(x1), r1=129(y1), r2=60(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 129
LDI r2, 60
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
