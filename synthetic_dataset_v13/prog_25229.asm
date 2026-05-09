; DESCRIPTION: Draws a cyan line from (11, 203) to (327, 157).
; PLAN: r0=11(x1), r1=203(y1), r2=327(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 203
LDI r2, 327
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
