; DESCRIPTION: Composite: Places a green dot at position (261, 130) then Places a red circle of radius 13 at center (300, 141).
; PLAN: r0=261(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=141(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 141
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
