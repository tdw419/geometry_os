; DESCRIPTION: Draws a cyan line from (456, 175) to (319, 34).
; PLAN: r0=456(x1), r1=175(y1), r2=319(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 175
LDI r2, 319
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
