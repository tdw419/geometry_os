; DESCRIPTION: Composite: Renders a magenta line between points (336, 78) and (479, 85) then Renders a white disk with center (298, 98) and radius 50.
; PLAN: r0=336(x1), r1=78(y1), r2=479(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=98(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 78
LDI r2, 479
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 98
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
