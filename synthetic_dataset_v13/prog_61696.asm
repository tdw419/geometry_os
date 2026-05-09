; DESCRIPTION: Draws a cyan line from (9, 45) to (190, 15).
; PLAN: r0=9(x1), r1=45(y1), r2=190(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 45
LDI r2, 190
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
