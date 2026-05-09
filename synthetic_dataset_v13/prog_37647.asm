; DESCRIPTION: Draws a yellow line from (494, 42) to (74, 114).
; PLAN: r0=494(x1), r1=42(y1), r2=74(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 42
LDI r2, 74
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
