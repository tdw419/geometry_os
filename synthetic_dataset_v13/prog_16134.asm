; DESCRIPTION: Draws a cyan line from (47, 10) to (270, 7).
; PLAN: r0=47(x1), r1=10(y1), r2=270(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 10
LDI r2, 270
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
