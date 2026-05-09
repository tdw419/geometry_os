; DESCRIPTION: Composite: Places a white circle of radius 44 at center (455, 158) then Renders a yellow box of size 88x111 starting at (413, 73).
; PLAN: r0=455(x), r1=158(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=73(y), r7=88(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 158
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 73
LDI r7, 88
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
