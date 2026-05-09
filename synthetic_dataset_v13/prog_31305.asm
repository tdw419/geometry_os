; DESCRIPTION: Draws a cyan line from (151, 49) to (9, 101).
; PLAN: r0=151(x1), r1=49(y1), r2=9(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 49
LDI r2, 9
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
