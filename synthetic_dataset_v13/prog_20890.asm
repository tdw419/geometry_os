; DESCRIPTION: Draws a cyan line from (259, 25) to (158, 62).
; PLAN: r0=259(x1), r1=25(y1), r2=158(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 25
LDI r2, 158
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
