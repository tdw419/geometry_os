; DESCRIPTION: Draws a green line from (116, 210) to (10, 123).
; PLAN: r0=116(x1), r1=210(y1), r2=10(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 210
LDI r2, 10
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
