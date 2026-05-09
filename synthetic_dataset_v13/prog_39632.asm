; DESCRIPTION: Draws a cyan line from (23, 122) to (139, 0).
; PLAN: r0=23(x1), r1=122(y1), r2=139(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 122
LDI r2, 139
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
