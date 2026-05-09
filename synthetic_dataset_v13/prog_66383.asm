; DESCRIPTION: Draws a cyan line from (205, 99) to (74, 34).
; PLAN: r0=205(x1), r1=99(y1), r2=74(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 99
LDI r2, 74
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
