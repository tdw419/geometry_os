; DESCRIPTION: Draws a cyan line from (501, 49) to (459, 134).
; PLAN: r0=501(x1), r1=49(y1), r2=459(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 49
LDI r2, 459
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
