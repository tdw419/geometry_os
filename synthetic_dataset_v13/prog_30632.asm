; DESCRIPTION: Draws a yellow line from (178, 98) to (5, 178).
; PLAN: r0=178(x1), r1=98(y1), r2=5(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 98
LDI r2, 5
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
