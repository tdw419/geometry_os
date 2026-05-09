; DESCRIPTION: Composite: Renders a green box of size 90x116 starting at (411, 80) then Places a magenta circle of radius 14 at center (106, 183).
; PLAN: r0=411(x), r1=80(y), r2=90(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=183(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 80
LDI r2, 90
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 183
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
