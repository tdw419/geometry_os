; DESCRIPTION: Draws a blue line from (401, 0) to (246, 117).
; PLAN: r0=401(x1), r1=0(y1), r2=246(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 0
LDI r2, 246
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
