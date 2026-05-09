; DESCRIPTION: Draws a white line from (372, 99) to (172, 219).
; PLAN: r0=372(x1), r1=99(y1), r2=172(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 99
LDI r2, 172
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
