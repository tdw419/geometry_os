; DESCRIPTION: Draws a magenta line from (405, 216) to (152, 87).
; PLAN: r0=405(x1), r1=216(y1), r2=152(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 216
LDI r2, 152
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
