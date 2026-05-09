; DESCRIPTION: Draws a green line from (202, 35) to (161, 47).
; PLAN: r0=202(x1), r1=35(y1), r2=161(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 35
LDI r2, 161
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
