; DESCRIPTION: Composite: Renders a orange disk with center (260, 101) and radius 72 then Renders a yellow box of size 59x27 starting at (361, 199).
; PLAN: r0=260(x), r1=101(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=199(y), r7=59(width), r8=27(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 101
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 199
LDI r7, 59
LDI r8, 27
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
