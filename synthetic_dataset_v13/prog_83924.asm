; DESCRIPTION: Draws a cyan line from (301, 71) to (5, 212).
; PLAN: r0=301(x1), r1=71(y1), r2=5(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 71
LDI r2, 5
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
