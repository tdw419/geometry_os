; DESCRIPTION: Draws a cyan line from (60, 36) to (498, 4).
; PLAN: r0=60(x1), r1=36(y1), r2=498(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 36
LDI r2, 498
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
