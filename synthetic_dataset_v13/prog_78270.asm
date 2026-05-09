; DESCRIPTION: Draws a cyan line from (301, 160) to (426, 185).
; PLAN: r0=301(x1), r1=160(y1), r2=426(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 160
LDI r2, 426
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
