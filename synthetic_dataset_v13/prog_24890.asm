; DESCRIPTION: Composite: Renders a cyan box of size 85x23 starting at (418, 76) then Places a magenta circle of radius 39 at center (92, 70).
; PLAN: r0=418(x), r1=76(y), r2=85(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=70(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 76
LDI r2, 85
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 70
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
