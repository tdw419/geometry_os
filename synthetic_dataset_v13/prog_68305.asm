; DESCRIPTION: Draws a green line from (413, 50) to (292, 62).
; PLAN: r0=413(x1), r1=50(y1), r2=292(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 50
LDI r2, 292
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
