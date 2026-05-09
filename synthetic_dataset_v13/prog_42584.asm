; DESCRIPTION: Draws a cyan line from (436, 106) to (139, 18).
; PLAN: r0=436(x1), r1=106(y1), r2=139(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 106
LDI r2, 139
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
