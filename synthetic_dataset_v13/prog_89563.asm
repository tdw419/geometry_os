; DESCRIPTION: Composite: Renders a white line between points (443, 200) and (298, 1) then Draws a cyan circle centered at (253, 107) with radius 61.
; PLAN: r0=443(x1), r1=200(y1), r2=298(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=107(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 200
LDI r2, 298
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 107
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
