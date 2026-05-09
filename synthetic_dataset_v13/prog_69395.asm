; DESCRIPTION: Draws a cyan line from (172, 230) to (406, 216).
; PLAN: r0=172(x1), r1=230(y1), r2=406(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 230
LDI r2, 406
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
