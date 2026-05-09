; DESCRIPTION: Draws a cyan line from (498, 49) to (29, 212).
; PLAN: r0=498(x1), r1=49(y1), r2=29(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 49
LDI r2, 29
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
