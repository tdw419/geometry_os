; DESCRIPTION: Draws a cyan line from (101, 174) to (324, 212).
; PLAN: r0=101(x1), r1=174(y1), r2=324(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 174
LDI r2, 324
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
