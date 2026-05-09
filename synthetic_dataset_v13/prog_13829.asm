; DESCRIPTION: Draws a green line from (399, 245) to (317, 167).
; PLAN: r0=399(x1), r1=245(y1), r2=317(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 245
LDI r2, 317
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
