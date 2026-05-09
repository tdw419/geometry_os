; DESCRIPTION: Draws a magenta line from (120, 61) to (445, 61).
; PLAN: r0=120(x1), r1=61(y1), r2=445(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 61
LDI r2, 445
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
