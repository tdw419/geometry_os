; DESCRIPTION: Draws a green line from (408, 126) to (430, 43).
; PLAN: r0=408(x1), r1=126(y1), r2=430(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 126
LDI r2, 430
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
