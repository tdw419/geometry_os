; DESCRIPTION: Draws a yellow line from (291, 45) to (327, 186).
; PLAN: r0=291(x1), r1=45(y1), r2=327(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 45
LDI r2, 327
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
