; DESCRIPTION: Composite: Places a orange circle of radius 30 at center (99, 210) then Renders a orange box of size 77x11 starting at (418, 245).
; PLAN: r0=99(x), r1=210(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=245(y), r7=77(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 210
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 245
LDI r7, 77
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
