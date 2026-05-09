; DESCRIPTION: Draws a green line from (121, 66) to (59, 108).
; PLAN: r0=121(x1), r1=66(y1), r2=59(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 66
LDI r2, 59
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
