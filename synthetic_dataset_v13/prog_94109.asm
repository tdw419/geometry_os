; DESCRIPTION: Draws a red line from (422, 64) to (247, 167).
; PLAN: r0=422(x1), r1=64(y1), r2=247(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 64
LDI r2, 247
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
