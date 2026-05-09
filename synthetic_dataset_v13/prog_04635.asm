; DESCRIPTION: Draws a cyan line from (102, 140) to (341, 234).
; PLAN: r0=102(x1), r1=140(y1), r2=341(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 140
LDI r2, 341
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
