; DESCRIPTION: Composite: Renders a black disk with center (138, 166) and radius 63 then Renders a blue box of size 58x44 starting at (400, 13).
; PLAN: r0=138(x), r1=166(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=13(y), r7=58(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 166
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 13
LDI r7, 58
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
