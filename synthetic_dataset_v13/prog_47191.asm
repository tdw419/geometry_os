; DESCRIPTION: Composite: Renders a black box of size 63x28 starting at (109, 203) then Sets a single cyan pixel at (402, 69).
; PLAN: r0=109(x), r1=203(y), r2=63(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=69(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 203
LDI r2, 63
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 69
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
