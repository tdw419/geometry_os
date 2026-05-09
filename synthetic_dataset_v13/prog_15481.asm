; DESCRIPTION: Composite: Renders a yellow line between points (399, 177) and (500, 36) then Renders a cyan disk with center (282, 157) and radius 34.
; PLAN: r0=399(x1), r1=177(y1), r2=500(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=157(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 177
LDI r2, 500
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 157
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
