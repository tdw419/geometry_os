; DESCRIPTION: Renders a cyan line between points (167, 92) and (472, 102).
; PLAN: r0=167(x1), r1=92(y1), r2=472(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 92
LDI r2, 472
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
