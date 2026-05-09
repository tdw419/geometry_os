; DESCRIPTION: Draws a yellow line from (61, 11) to (228, 164).
; PLAN: r0=61(x1), r1=11(y1), r2=228(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 11
LDI r2, 228
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
