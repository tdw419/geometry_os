; DESCRIPTION: Composite: Renders a blue line between points (92, 169) and (115, 53) then Renders a cyan disk with center (314, 129) and radius 64.
; PLAN: r0=92(x1), r1=169(y1), r2=115(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=129(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 169
LDI r2, 115
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 129
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
