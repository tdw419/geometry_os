; DESCRIPTION: Renders a white line between points (242, 129) and (435, 106).
; PLAN: r0=242(x1), r1=129(y1), r2=435(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 129
LDI r2, 435
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
