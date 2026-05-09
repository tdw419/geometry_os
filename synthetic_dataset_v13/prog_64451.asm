; DESCRIPTION: Draws a magenta line from (284, 143) to (270, 42).
; PLAN: r0=284(x1), r1=143(y1), r2=270(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 143
LDI r2, 270
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
