; DESCRIPTION: Draws a cyan line from (170, 72) to (481, 104).
; PLAN: r0=170(x1), r1=72(y1), r2=481(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 72
LDI r2, 481
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
