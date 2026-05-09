; DESCRIPTION: Composite: Renders a magenta box of size 32x75 starting at (363, 17) then Places a magenta circle of radius 27 at center (213, 196).
; PLAN: r0=363(x), r1=17(y), r2=32(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=196(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 17
LDI r2, 32
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 196
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
