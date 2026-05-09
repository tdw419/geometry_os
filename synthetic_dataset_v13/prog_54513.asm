; DESCRIPTION: Draws a cyan line from (26, 255) to (253, 190).
; PLAN: r0=26(x1), r1=255(y1), r2=253(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 255
LDI r2, 253
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
