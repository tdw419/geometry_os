; DESCRIPTION: Draws a cyan line from (339, 138) to (73, 23).
; PLAN: r0=339(x1), r1=138(y1), r2=73(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 138
LDI r2, 73
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
