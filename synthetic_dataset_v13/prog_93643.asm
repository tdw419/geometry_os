; DESCRIPTION: Draws a yellow line from (82, 197) to (170, 114).
; PLAN: r0=82(x1), r1=197(y1), r2=170(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 197
LDI r2, 170
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
