; DESCRIPTION: Draws a yellow line from (50, 94) to (307, 49).
; PLAN: r0=50(x1), r1=94(y1), r2=307(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 94
LDI r2, 307
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
