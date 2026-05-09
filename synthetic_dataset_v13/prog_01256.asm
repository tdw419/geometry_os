; DESCRIPTION: Draws a cyan line from (102, 94) to (352, 114).
; PLAN: r0=102(x1), r1=94(y1), r2=352(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 94
LDI r2, 352
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
