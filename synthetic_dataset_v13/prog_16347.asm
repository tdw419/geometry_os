; DESCRIPTION: Draws a yellow line from (380, 179) to (455, 27).
; PLAN: r0=380(x1), r1=179(y1), r2=455(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 179
LDI r2, 455
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
