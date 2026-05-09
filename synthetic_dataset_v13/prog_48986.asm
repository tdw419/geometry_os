; DESCRIPTION: Places a red line segment connecting (121, 109) to (258, 228).
; PLAN: r0=121(x1), r1=109(y1), r2=258(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 109
LDI r2, 258
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
