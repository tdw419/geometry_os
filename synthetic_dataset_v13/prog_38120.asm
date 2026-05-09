; DESCRIPTION: Places a red line segment connecting (252, 223) to (228, 143).
; PLAN: r0=252(x1), r1=223(y1), r2=228(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 223
LDI r2, 228
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
