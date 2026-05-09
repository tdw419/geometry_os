; DESCRIPTION: Draws a orange line from (256, 184) to (405, 177).
; PLAN: r0=256(x1), r1=184(y1), r2=405(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 184
LDI r2, 405
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
