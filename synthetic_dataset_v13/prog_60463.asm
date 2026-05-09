; DESCRIPTION: Draws a yellow line from (170, 64) to (146, 254).
; PLAN: r0=170(x1), r1=64(y1), r2=146(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 64
LDI r2, 146
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
