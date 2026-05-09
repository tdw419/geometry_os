; DESCRIPTION: Draws a black line from (452, 103) to (435, 231).
; PLAN: r0=452(x1), r1=103(y1), r2=435(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 103
LDI r2, 435
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
