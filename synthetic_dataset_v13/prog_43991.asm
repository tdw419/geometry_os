; DESCRIPTION: Draws a green line from (294, 46) to (311, 24).
; PLAN: r0=294(x1), r1=46(y1), r2=311(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 46
LDI r2, 311
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
