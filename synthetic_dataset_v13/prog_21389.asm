; DESCRIPTION: Composite: Renders a black disk with center (279, 93) and radius 74 then Renders a cyan box of size 20x103 starting at (436, 49).
; PLAN: r0=279(x), r1=93(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=49(y), r7=20(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 93
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 49
LDI r7, 20
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
