; DESCRIPTION: Draws a yellow line from (193, 6) to (168, 197).
; PLAN: r0=193(x1), r1=6(y1), r2=168(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 6
LDI r2, 168
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
