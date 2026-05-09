; DESCRIPTION: Draws a yellow line from (197, 126) to (214, 36).
; PLAN: r0=197(x1), r1=126(y1), r2=214(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 126
LDI r2, 214
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
