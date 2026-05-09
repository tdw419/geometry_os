; DESCRIPTION: Draws a cyan line from (93, 0) to (167, 130).
; PLAN: r0=93(x1), r1=0(y1), r2=167(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 0
LDI r2, 167
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
