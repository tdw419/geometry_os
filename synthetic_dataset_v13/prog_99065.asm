; DESCRIPTION: Draws a cyan line from (102, 177) to (222, 245).
; PLAN: r0=102(x1), r1=177(y1), r2=222(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 177
LDI r2, 222
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
