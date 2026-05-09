; DESCRIPTION: Draws a cyan line from (83, 157) to (114, 161).
; PLAN: r0=83(x1), r1=157(y1), r2=114(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 114
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
