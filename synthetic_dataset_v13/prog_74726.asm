; DESCRIPTION: Draws a green line from (292, 127) to (32, 86).
; PLAN: r0=292(x1), r1=127(y1), r2=32(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 127
LDI r2, 32
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
