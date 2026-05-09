; DESCRIPTION: Draws a green line from (2, 39) to (149, 143).
; PLAN: r0=2(x1), r1=39(y1), r2=149(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 39
LDI r2, 149
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
