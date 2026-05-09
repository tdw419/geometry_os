; DESCRIPTION: Draws a magenta line from (117, 52) to (42, 146).
; PLAN: r0=117(x1), r1=52(y1), r2=42(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 52
LDI r2, 42
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
