; DESCRIPTION: Composite: Places a magenta circle of radius 21 at center (398, 175) then Renders a green box of size 96x85 starting at (56, 81).
; PLAN: r0=398(x), r1=175(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=81(y), r7=96(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 175
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 81
LDI r7, 96
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
