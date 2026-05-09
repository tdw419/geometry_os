; DESCRIPTION: Draws a cyan line from (331, 143) to (182, 105).
; PLAN: r0=331(x1), r1=143(y1), r2=182(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 143
LDI r2, 182
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
