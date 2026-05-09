; DESCRIPTION: Composite: Renders a black disk with center (140, 178) and radius 72 then Renders a white box of size 27x86 starting at (281, 15).
; PLAN: r0=140(x), r1=178(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=15(y), r7=27(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 178
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 15
LDI r7, 27
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
