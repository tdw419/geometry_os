; DESCRIPTION: Draws a green line from (265, 50) to (279, 81).
; PLAN: r0=265(x1), r1=50(y1), r2=279(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 50
LDI r2, 279
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
