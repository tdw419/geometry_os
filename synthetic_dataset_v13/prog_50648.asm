; DESCRIPTION: Draws a cyan line from (93, 140) to (67, 131).
; PLAN: r0=93(x1), r1=140(y1), r2=67(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 140
LDI r2, 67
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
