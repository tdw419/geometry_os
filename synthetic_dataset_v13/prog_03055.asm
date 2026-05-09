; DESCRIPTION: Draws a green line from (111, 74) to (87, 156).
; PLAN: r0=111(x1), r1=74(y1), r2=87(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 74
LDI r2, 87
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
