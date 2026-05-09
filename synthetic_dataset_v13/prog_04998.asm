; DESCRIPTION: Draws a green line from (292, 134) to (354, 32).
; PLAN: r0=292(x1), r1=134(y1), r2=354(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 134
LDI r2, 354
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
