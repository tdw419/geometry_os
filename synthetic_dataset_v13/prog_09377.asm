; DESCRIPTION: Draws a white line from (430, 242) to (160, 212).
; PLAN: r0=430(x1), r1=242(y1), r2=160(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 242
LDI r2, 160
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
