; DESCRIPTION: Draws a cyan line from (276, 161) to (96, 25).
; PLAN: r0=276(x1), r1=161(y1), r2=96(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 161
LDI r2, 96
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
