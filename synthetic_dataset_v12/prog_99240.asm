; DESCRIPTION: Draws a green line from (82, 213) to (316, 123).
; PLAN: r0=82(x1), r1=213(y1), r2=316(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 213
LDI r2, 316
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
