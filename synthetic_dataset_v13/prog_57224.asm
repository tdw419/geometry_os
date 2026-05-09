; DESCRIPTION: Draws a yellow line from (430, 4) to (202, 40).
; PLAN: r0=430(x1), r1=4(y1), r2=202(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 4
LDI r2, 202
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
