; DESCRIPTION: Draws a green line from (12, 43) to (65, 231).
; PLAN: r0=12(x1), r1=43(y1), r2=65(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 43
LDI r2, 65
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
