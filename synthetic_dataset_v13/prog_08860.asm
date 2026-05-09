; DESCRIPTION: Draws a magenta line from (80, 129) to (327, 241).
; PLAN: r0=80(x1), r1=129(y1), r2=327(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 129
LDI r2, 327
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
