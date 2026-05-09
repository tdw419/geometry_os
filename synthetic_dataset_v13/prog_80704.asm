; DESCRIPTION: Draws a cyan line from (179, 212) to (171, 49).
; PLAN: r0=179(x1), r1=212(y1), r2=171(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 212
LDI r2, 171
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
