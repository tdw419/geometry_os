; DESCRIPTION: Composite: Renders a cyan box of size 15x57 starting at (6, 134) then Draws a magenta circle centered at (298, 149) with radius 28.
; PLAN: r0=6(x), r1=134(y), r2=15(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=149(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 134
LDI r2, 15
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 149
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
