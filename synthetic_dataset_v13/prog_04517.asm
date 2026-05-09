; DESCRIPTION: Draws a cyan line from (57, 157) to (248, 98).
; PLAN: r0=57(x1), r1=157(y1), r2=248(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 157
LDI r2, 248
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
