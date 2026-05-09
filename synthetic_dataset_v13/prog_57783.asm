; DESCRIPTION: Draws a green line from (376, 195) to (183, 50).
; PLAN: r0=376(x1), r1=195(y1), r2=183(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 195
LDI r2, 183
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
