; DESCRIPTION: Draws a cyan line from (472, 32) to (139, 163).
; PLAN: r0=472(x1), r1=32(y1), r2=139(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 32
LDI r2, 139
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
