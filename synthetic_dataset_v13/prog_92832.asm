; DESCRIPTION: Composite: Renders a black line between points (262, 130) and (295, 212) then Renders a cyan disk with center (419, 129) and radius 76.
; PLAN: r0=262(x1), r1=130(y1), r2=295(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=129(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 130
LDI r2, 295
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 129
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
