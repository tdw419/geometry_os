; DESCRIPTION: Draws a green line from (483, 254) to (281, 187).
; PLAN: r0=483(x1), r1=254(y1), r2=281(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 254
LDI r2, 281
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
