; DESCRIPTION: Composite: Creates a black circular shape at (206, 120) with radius 22 then Renders a magenta box of size 85x56 starting at (383, 87).
; PLAN: r0=206(x), r1=120(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=87(y), r7=85(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 120
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 87
LDI r7, 85
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
