; DESCRIPTION: Draws a cyan line from (458, 52) to (72, 75).
; PLAN: r0=458(x1), r1=52(y1), r2=72(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 52
LDI r2, 72
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
