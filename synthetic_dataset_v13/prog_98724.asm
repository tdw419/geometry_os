; DESCRIPTION: Draws a magenta line from (204, 59) to (200, 228).
; PLAN: r0=204(x1), r1=59(y1), r2=200(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 59
LDI r2, 200
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
