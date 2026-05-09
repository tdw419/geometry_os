; DESCRIPTION: Draws a black line from (149, 198) to (152, 215).
; PLAN: r0=149(x1), r1=198(y1), r2=152(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 198
LDI r2, 152
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
