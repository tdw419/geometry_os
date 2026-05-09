; DESCRIPTION: Composite: Renders a white disk with center (203, 102) and radius 51 then Renders a cyan line between points (249, 64) and (70, 60).
; PLAN: r0=203(x), r1=102(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=64(y1), r7=70(x2), r8=60(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 102
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 64
LDI r7, 70
LDI r8, 60
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
