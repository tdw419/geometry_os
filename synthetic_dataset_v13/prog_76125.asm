; DESCRIPTION: Draws a yellow line from (58, 228) to (193, 144).
; PLAN: r0=58(x1), r1=228(y1), r2=193(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 228
LDI r2, 193
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
