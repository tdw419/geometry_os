; DESCRIPTION: Draws a cyan line from (117, 101) to (22, 255).
; PLAN: r0=117(x1), r1=101(y1), r2=22(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 101
LDI r2, 22
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
