; DESCRIPTION: Composite: Renders a white line between points (425, 205) and (172, 96) then Renders a black disk with center (370, 107) and radius 52.
; PLAN: r0=425(x1), r1=205(y1), r2=172(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=107(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 205
LDI r2, 172
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 107
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
