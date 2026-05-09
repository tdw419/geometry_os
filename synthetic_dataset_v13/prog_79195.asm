; DESCRIPTION: Composite: Renders a cyan box of size 12x48 starting at (120, 137) then Renders a white disk with center (405, 189) and radius 25.
; PLAN: r0=120(x), r1=137(y), r2=12(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=189(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 137
LDI r2, 12
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 189
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
