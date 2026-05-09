; DESCRIPTION: Draws a magenta line from (272, 249) to (292, 187).
; PLAN: r0=272(x1), r1=249(y1), r2=292(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 249
LDI r2, 292
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
