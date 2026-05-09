; DESCRIPTION: Draws a yellow line from (164, 221) to (334, 196).
; PLAN: r0=164(x1), r1=221(y1), r2=334(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 221
LDI r2, 334
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
