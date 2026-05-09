; DESCRIPTION: Composite: Renders a green box of size 56x111 starting at (329, 119) then Creates a orange circular shape at (394, 103) with radius 13.
; PLAN: r0=329(x), r1=119(y), r2=56(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=103(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 119
LDI r2, 56
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 103
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
