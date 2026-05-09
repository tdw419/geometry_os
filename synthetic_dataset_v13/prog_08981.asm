; DESCRIPTION: Draws a green line from (39, 134) to (301, 166).
; PLAN: r0=39(x1), r1=134(y1), r2=301(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 134
LDI r2, 301
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
