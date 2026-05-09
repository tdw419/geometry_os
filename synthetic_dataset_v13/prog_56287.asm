; DESCRIPTION: Draws a red line from (26, 184) to (242, 167).
; PLAN: r0=26(x1), r1=184(y1), r2=242(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 184
LDI r2, 242
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
