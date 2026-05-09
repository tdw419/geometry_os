; DESCRIPTION: Draws a magenta line from (168, 52) to (393, 249).
; PLAN: r0=168(x1), r1=52(y1), r2=393(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 52
LDI r2, 393
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
