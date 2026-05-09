; DESCRIPTION: Draws a green line from (47, 22) to (39, 14).
; PLAN: r0=47(x1), r1=22(y1), r2=39(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 22
LDI r2, 39
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
