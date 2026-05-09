; DESCRIPTION: Draws a yellow line from (48, 183) to (318, 42).
; PLAN: r0=48(x1), r1=183(y1), r2=318(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 183
LDI r2, 318
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
