; DESCRIPTION: Draws a green line from (302, 223) to (255, 127).
; PLAN: r0=302(x1), r1=223(y1), r2=255(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 223
LDI r2, 255
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
