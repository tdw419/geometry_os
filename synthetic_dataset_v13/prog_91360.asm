; DESCRIPTION: Draws a cyan line from (74, 139) to (37, 248).
; PLAN: r0=74(x1), r1=139(y1), r2=37(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 139
LDI r2, 37
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
