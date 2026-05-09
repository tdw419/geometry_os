; DESCRIPTION: Draws a white line from (158, 36) to (364, 42).
; PLAN: r0=158(x1), r1=36(y1), r2=364(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 36
LDI r2, 364
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
