; DESCRIPTION: Composite: Renders a blue box of size 115x23 starting at (21, 177) then Renders a cyan disk with center (210, 241) and radius 11.
; PLAN: r0=21(x), r1=177(y), r2=115(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=241(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 177
LDI r2, 115
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 241
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
