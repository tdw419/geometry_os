; DESCRIPTION: Draws a cyan line from (116, 246) to (336, 242).
; PLAN: r0=116(x1), r1=246(y1), r2=336(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 246
LDI r2, 336
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
