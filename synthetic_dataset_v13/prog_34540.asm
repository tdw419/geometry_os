; DESCRIPTION: Draws a cyan line from (212, 211) to (102, 129).
; PLAN: r0=212(x1), r1=211(y1), r2=102(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 211
LDI r2, 102
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
