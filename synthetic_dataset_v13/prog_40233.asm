; DESCRIPTION: Draws a cyan line from (324, 30) to (182, 78).
; PLAN: r0=324(x1), r1=30(y1), r2=182(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 30
LDI r2, 182
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
