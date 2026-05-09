; DESCRIPTION: Draws a yellow line from (327, 129) to (412, 124).
; PLAN: r0=327(x1), r1=129(y1), r2=412(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 129
LDI r2, 412
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
