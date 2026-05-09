; DESCRIPTION: Draws a cyan line from (328, 41) to (101, 131).
; PLAN: r0=328(x1), r1=41(y1), r2=101(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 41
LDI r2, 101
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
