; DESCRIPTION: Draws a green line from (301, 195) to (360, 8).
; PLAN: r0=301(x1), r1=195(y1), r2=360(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 195
LDI r2, 360
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
