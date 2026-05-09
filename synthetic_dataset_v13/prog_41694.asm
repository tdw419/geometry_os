; DESCRIPTION: Draws a cyan line from (332, 157) to (251, 238).
; PLAN: r0=332(x1), r1=157(y1), r2=251(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 157
LDI r2, 251
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
