; DESCRIPTION: Draws a magenta line from (446, 82) to (1, 8).
; PLAN: r0=446(x1), r1=82(y1), r2=1(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 82
LDI r2, 1
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
