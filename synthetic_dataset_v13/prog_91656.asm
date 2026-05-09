; DESCRIPTION: Places a red line segment connecting (446, 42) to (227, 217).
; PLAN: r0=446(x1), r1=42(y1), r2=227(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 42
LDI r2, 227
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
