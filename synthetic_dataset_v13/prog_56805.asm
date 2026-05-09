; DESCRIPTION: Draws a magenta line from (221, 4) to (401, 29).
; PLAN: r0=221(x1), r1=4(y1), r2=401(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 4
LDI r2, 401
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
