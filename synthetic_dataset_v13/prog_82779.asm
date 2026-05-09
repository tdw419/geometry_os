; DESCRIPTION: Draws a red line from (252, 228) to (30, 40).
; PLAN: r0=252(x1), r1=228(y1), r2=30(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 228
LDI r2, 30
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
