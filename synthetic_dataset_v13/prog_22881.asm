; DESCRIPTION: Draws a green line from (268, 81) to (328, 21).
; PLAN: r0=268(x1), r1=81(y1), r2=328(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 81
LDI r2, 328
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
