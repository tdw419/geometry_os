; DESCRIPTION: Places a red line segment connecting (179, 117) to (151, 228).
; PLAN: r0=179(x1), r1=117(y1), r2=151(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 117
LDI r2, 151
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
