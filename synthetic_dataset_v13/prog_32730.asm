; DESCRIPTION: Draws a yellow line from (198, 167) to (262, 29).
; PLAN: r0=198(x1), r1=167(y1), r2=262(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 167
LDI r2, 262
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
