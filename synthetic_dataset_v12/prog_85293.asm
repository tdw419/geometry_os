; DESCRIPTION: Draws a cyan line from (408, 53) to (498, 15).
; PLAN: r0=408(x1), r1=53(y1), r2=498(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 53
LDI r2, 498
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
