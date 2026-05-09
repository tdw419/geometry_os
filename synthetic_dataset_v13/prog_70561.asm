; DESCRIPTION: Draws a cyan line from (255, 119) to (190, 128).
; PLAN: r0=255(x1), r1=119(y1), r2=190(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 119
LDI r2, 190
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
