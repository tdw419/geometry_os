; DESCRIPTION: Places a magenta line segment connecting (502, 39) to (274, 129).
; PLAN: r0=502(x1), r1=39(y1), r2=274(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 39
LDI r2, 274
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
