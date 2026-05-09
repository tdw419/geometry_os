; DESCRIPTION: Draws a yellow line from (344, 228) to (260, 172).
; PLAN: r0=344(x1), r1=228(y1), r2=260(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 228
LDI r2, 260
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
