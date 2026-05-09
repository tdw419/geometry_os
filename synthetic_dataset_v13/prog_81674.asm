; DESCRIPTION: Renders a magenta line between points (403, 129) and (381, 192).
; PLAN: r0=403(x1), r1=129(y1), r2=381(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 129
LDI r2, 381
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
