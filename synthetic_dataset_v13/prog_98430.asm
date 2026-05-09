; DESCRIPTION: Draws a yellow line from (428, 66) to (483, 228).
; PLAN: r0=428(x1), r1=66(y1), r2=483(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 66
LDI r2, 483
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
