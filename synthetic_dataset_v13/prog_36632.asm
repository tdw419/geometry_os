; DESCRIPTION: Composite: Renders a cyan box of size 42x79 starting at (421, 64) then Draws a green circle centered at (49, 79) with radius 47.
; PLAN: r0=421(x), r1=64(y), r2=42(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=79(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 64
LDI r2, 42
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 79
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
