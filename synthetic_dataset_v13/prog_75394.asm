; DESCRIPTION: Places a red line segment connecting (147, 228) to (6, 214).
; PLAN: r0=147(x1), r1=228(y1), r2=6(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 228
LDI r2, 6
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
