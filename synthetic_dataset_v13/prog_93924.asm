; DESCRIPTION: Draws a red line from (417, 64) to (287, 210).
; PLAN: r0=417(x1), r1=64(y1), r2=287(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 64
LDI r2, 287
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
