; DESCRIPTION: Draws a green line from (108, 5) to (304, 226).
; PLAN: r0=108(x1), r1=5(y1), r2=304(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 5
LDI r2, 304
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
