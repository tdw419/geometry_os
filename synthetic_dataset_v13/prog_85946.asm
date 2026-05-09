; DESCRIPTION: Renders a magenta line between points (92, 129) and (397, 207).
; PLAN: r0=92(x1), r1=129(y1), r2=397(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 129
LDI r2, 397
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
