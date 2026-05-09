; DESCRIPTION: Renders a magenta line between points (215, 129) and (463, 19).
; PLAN: r0=215(x1), r1=129(y1), r2=463(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 129
LDI r2, 463
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
