; DESCRIPTION: Renders a magenta line between points (179, 129) and (412, 14).
; PLAN: r0=179(x1), r1=129(y1), r2=412(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 129
LDI r2, 412
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
