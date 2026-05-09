; DESCRIPTION: Draws a cyan line from (116, 149) to (441, 139).
; PLAN: r0=116(x1), r1=149(y1), r2=441(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 149
LDI r2, 441
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
