; DESCRIPTION: Draws a cyan line from (123, 158) to (270, 11).
; PLAN: r0=123(x1), r1=158(y1), r2=270(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 158
LDI r2, 270
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
