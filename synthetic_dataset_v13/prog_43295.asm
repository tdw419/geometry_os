; DESCRIPTION: Draws a cyan line from (289, 162) to (134, 167).
; PLAN: r0=289(x1), r1=162(y1), r2=134(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 162
LDI r2, 134
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
