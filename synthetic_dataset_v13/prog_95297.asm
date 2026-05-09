; DESCRIPTION: Draws a cyan line from (22, 189) to (451, 152).
; PLAN: r0=22(x1), r1=189(y1), r2=451(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 189
LDI r2, 451
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
