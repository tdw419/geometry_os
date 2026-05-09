; DESCRIPTION: Draws a magenta line from (8, 245) to (240, 42).
; PLAN: r0=8(x1), r1=245(y1), r2=240(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 245
LDI r2, 240
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
