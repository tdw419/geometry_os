; DESCRIPTION: Draws a green line from (340, 85) to (319, 9).
; PLAN: r0=340(x1), r1=85(y1), r2=319(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 85
LDI r2, 319
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
