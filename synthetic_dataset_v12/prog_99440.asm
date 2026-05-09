; DESCRIPTION: Composite: Places a blue dot at position (338, 130) then Renders a yellow box of size 29x74 starting at (239, 71).
; PLAN: r0=338(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=71(y), r7=29(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 130
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 71
LDI r7, 29
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
