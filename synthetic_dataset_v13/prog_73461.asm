; DESCRIPTION: Draws a cyan line from (93, 27) to (457, 153).
; PLAN: r0=93(x1), r1=27(y1), r2=457(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 27
LDI r2, 457
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
