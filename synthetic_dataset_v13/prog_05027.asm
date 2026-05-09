; DESCRIPTION: Draws a magenta line from (280, 213) to (403, 185).
; PLAN: r0=280(x1), r1=213(y1), r2=403(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 213
LDI r2, 403
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
