; DESCRIPTION: Draws a black line from (117, 149) to (321, 182).
; PLAN: r0=117(x1), r1=149(y1), r2=321(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 149
LDI r2, 321
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
