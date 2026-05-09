; DESCRIPTION: Draws a green line from (59, 168) to (406, 4).
; PLAN: r0=59(x1), r1=168(y1), r2=406(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 168
LDI r2, 406
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
