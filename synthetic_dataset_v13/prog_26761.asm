; DESCRIPTION: Draws a cyan line from (292, 17) to (143, 31).
; PLAN: r0=292(x1), r1=17(y1), r2=143(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 17
LDI r2, 143
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
