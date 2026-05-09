; DESCRIPTION: Places a red line segment connecting (453, 63) to (437, 228).
; PLAN: r0=453(x1), r1=63(y1), r2=437(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 63
LDI r2, 437
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
