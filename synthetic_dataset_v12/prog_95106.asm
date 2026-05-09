; DESCRIPTION: Draws a cyan line from (10, 182) to (11, 50).
; PLAN: r0=10(x1), r1=182(y1), r2=11(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 182
LDI r2, 11
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
