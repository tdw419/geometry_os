; DESCRIPTION: Draws a green line from (65, 218) to (210, 6).
; PLAN: r0=65(x1), r1=218(y1), r2=210(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 218
LDI r2, 210
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
