; DESCRIPTION: Draws a yellow line from (13, 228) to (301, 220).
; PLAN: r0=13(x1), r1=228(y1), r2=301(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 228
LDI r2, 301
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
