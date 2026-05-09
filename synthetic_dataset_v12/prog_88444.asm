; DESCRIPTION: Draws a black line from (456, 23) to (186, 168).
; PLAN: r0=456(x1), r1=23(y1), r2=186(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 23
LDI r2, 186
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
