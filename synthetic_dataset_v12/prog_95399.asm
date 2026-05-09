; DESCRIPTION: Draws a cyan line from (143, 242) to (490, 7).
; PLAN: r0=143(x1), r1=242(y1), r2=490(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 242
LDI r2, 490
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
