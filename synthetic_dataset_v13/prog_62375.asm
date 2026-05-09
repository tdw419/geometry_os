; DESCRIPTION: Draws a yellow line from (228, 17) to (509, 207).
; PLAN: r0=228(x1), r1=17(y1), r2=509(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 17
LDI r2, 509
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
