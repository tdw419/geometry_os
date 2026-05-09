; DESCRIPTION: Draws a green line from (138, 5) to (205, 183).
; PLAN: r0=138(x1), r1=5(y1), r2=205(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 5
LDI r2, 205
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
