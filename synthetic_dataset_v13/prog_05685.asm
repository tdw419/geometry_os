; DESCRIPTION: Draws a cyan line from (137, 115) to (25, 139).
; PLAN: r0=137(x1), r1=115(y1), r2=25(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 115
LDI r2, 25
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
