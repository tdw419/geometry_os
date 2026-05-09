; DESCRIPTION: Places a red line segment connecting (192, 39) to (42, 222).
; PLAN: r0=192(x1), r1=39(y1), r2=42(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 39
LDI r2, 42
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
