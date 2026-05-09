; DESCRIPTION: Composite: Renders a orange box of size 97x112 starting at (402, 108) then Renders a orange disk with center (196, 191) and radius 54.
; PLAN: r0=402(x), r1=108(y), r2=97(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=191(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 108
LDI r2, 97
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 191
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
