; DESCRIPTION: Draws a green line from (91, 127) to (380, 84).
; PLAN: r0=91(x1), r1=127(y1), r2=380(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 127
LDI r2, 380
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
