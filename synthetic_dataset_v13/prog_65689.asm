; DESCRIPTION: Draws a cyan line from (370, 66) to (268, 238).
; PLAN: r0=370(x1), r1=66(y1), r2=268(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 66
LDI r2, 268
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
