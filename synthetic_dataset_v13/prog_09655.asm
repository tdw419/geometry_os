; DESCRIPTION: Draws a yellow line from (370, 98) to (207, 64).
; PLAN: r0=370(x1), r1=98(y1), r2=207(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 98
LDI r2, 207
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
