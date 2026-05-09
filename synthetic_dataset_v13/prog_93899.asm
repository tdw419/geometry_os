; DESCRIPTION: Renders a cyan line between points (357, 129) and (270, 53).
; PLAN: r0=357(x1), r1=129(y1), r2=270(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 129
LDI r2, 270
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
