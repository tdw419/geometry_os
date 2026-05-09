; DESCRIPTION: Draws a cyan line from (88, 195) to (342, 138).
; PLAN: r0=88(x1), r1=195(y1), r2=342(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 195
LDI r2, 342
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
