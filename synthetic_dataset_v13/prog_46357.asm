; DESCRIPTION: Draws a white line from (256, 187) to (254, 99).
; PLAN: r0=256(x1), r1=187(y1), r2=254(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 187
LDI r2, 254
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
