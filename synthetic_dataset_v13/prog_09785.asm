; DESCRIPTION: Draws a yellow line from (384, 83) to (377, 42).
; PLAN: r0=384(x1), r1=83(y1), r2=377(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 83
LDI r2, 377
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
