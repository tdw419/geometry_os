; DESCRIPTION: Draws a cyan line from (101, 17) to (247, 241).
; PLAN: r0=101(x1), r1=17(y1), r2=247(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 17
LDI r2, 247
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
