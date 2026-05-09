; DESCRIPTION: Draws a cyan line from (17, 159) to (335, 172).
; PLAN: r0=17(x1), r1=159(y1), r2=335(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 159
LDI r2, 335
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
