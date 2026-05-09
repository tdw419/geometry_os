; DESCRIPTION: Composite: Renders a cyan box of size 29x118 starting at (46, 48) then Renders a white disk with center (272, 131) and radius 38.
; PLAN: r0=46(x), r1=48(y), r2=29(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=131(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 48
LDI r2, 29
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 131
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
