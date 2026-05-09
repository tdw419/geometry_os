; DESCRIPTION: Draws a green line from (301, 2) to (313, 168).
; PLAN: r0=301(x1), r1=2(y1), r2=313(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 2
LDI r2, 313
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
