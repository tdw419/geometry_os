; DESCRIPTION: Composite: Renders a orange disk with center (454, 124) and radius 34 then Renders a black box of size 77x33 starting at (199, 42).
; PLAN: r0=454(x), r1=124(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=42(y), r7=77(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 124
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 42
LDI r7, 77
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
