; DESCRIPTION: Draws a orange line from (76, 103) to (405, 177).
; PLAN: r0=76(x1), r1=103(y1), r2=405(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 103
LDI r2, 405
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
