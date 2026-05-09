; DESCRIPTION: Draws a black line from (406, 152) to (94, 138).
; PLAN: r0=406(x1), r1=152(y1), r2=94(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 152
LDI r2, 94
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
