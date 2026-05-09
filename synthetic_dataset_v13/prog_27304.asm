; DESCRIPTION: Draws a cyan line from (368, 122) to (164, 162).
; PLAN: r0=368(x1), r1=122(y1), r2=164(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 122
LDI r2, 164
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
