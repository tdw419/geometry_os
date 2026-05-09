; DESCRIPTION: Draws a green line from (41, 224) to (280, 93).
; PLAN: r0=41(x1), r1=224(y1), r2=280(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 224
LDI r2, 280
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
