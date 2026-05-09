; DESCRIPTION: Draws a red line from (483, 48) to (107, 167).
; PLAN: r0=483(x1), r1=48(y1), r2=107(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 48
LDI r2, 107
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
