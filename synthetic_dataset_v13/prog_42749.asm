; DESCRIPTION: Draws a green line from (396, 115) to (307, 231).
; PLAN: r0=396(x1), r1=115(y1), r2=307(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 115
LDI r2, 307
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
