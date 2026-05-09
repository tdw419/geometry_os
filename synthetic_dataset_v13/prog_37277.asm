; DESCRIPTION: Draws a cyan line from (14, 182) to (223, 28).
; PLAN: r0=14(x1), r1=182(y1), r2=223(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 182
LDI r2, 223
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
