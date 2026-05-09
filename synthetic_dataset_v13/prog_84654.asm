; DESCRIPTION: Draws a cyan line from (60, 157) to (230, 75).
; PLAN: r0=60(x1), r1=157(y1), r2=230(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 157
LDI r2, 230
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
