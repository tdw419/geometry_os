; DESCRIPTION: Draws a cyan line from (248, 110) to (306, 82).
; PLAN: r0=248(x1), r1=110(y1), r2=306(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 110
LDI r2, 306
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
