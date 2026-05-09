; DESCRIPTION: Draws a magenta line from (403, 50) to (297, 19).
; PLAN: r0=403(x1), r1=50(y1), r2=297(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 50
LDI r2, 297
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
