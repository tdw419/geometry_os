; DESCRIPTION: Draws a black line from (32, 104) to (492, 46).
; PLAN: r0=32(x1), r1=104(y1), r2=492(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 104
LDI r2, 492
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
