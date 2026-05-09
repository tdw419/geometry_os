; DESCRIPTION: Composite: Renders a magenta box of size 44x106 starting at (209, 67) then Creates a magenta circular shape at (415, 179) with radius 72.
; PLAN: r0=209(x), r1=67(y), r2=44(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=179(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 67
LDI r2, 44
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 179
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
