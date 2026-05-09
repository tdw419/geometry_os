; DESCRIPTION: Draws a cyan line from (341, 96) to (379, 18).
; PLAN: r0=341(x1), r1=96(y1), r2=379(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 96
LDI r2, 379
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
