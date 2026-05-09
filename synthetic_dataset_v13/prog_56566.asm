; DESCRIPTION: Draws a green line from (116, 167) to (102, 50).
; PLAN: r0=116(x1), r1=167(y1), r2=102(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 167
LDI r2, 102
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
