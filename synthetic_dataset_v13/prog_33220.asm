; DESCRIPTION: Draws a green line from (84, 12) to (376, 42).
; PLAN: r0=84(x1), r1=12(y1), r2=376(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 12
LDI r2, 376
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
