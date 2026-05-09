; DESCRIPTION: Draws a cyan line from (0, 62) to (93, 1).
; PLAN: r0=0(x1), r1=62(y1), r2=93(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 62
LDI r2, 93
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
