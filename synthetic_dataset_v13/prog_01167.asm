; DESCRIPTION: Draws a magenta line from (410, 126) to (191, 163).
; PLAN: r0=410(x1), r1=126(y1), r2=191(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 126
LDI r2, 191
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
