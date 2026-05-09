; DESCRIPTION: Draws a magenta line from (252, 18) to (117, 27).
; PLAN: r0=252(x1), r1=18(y1), r2=117(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 18
LDI r2, 117
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
