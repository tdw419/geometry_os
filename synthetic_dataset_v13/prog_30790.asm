; DESCRIPTION: Renders a magenta line between points (373, 129) and (420, 83).
; PLAN: r0=373(x1), r1=129(y1), r2=420(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 129
LDI r2, 420
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
