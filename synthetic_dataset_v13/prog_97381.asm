; DESCRIPTION: Composite: Renders a orange disk with center (129, 112) and radius 49 then Places a orange 56x22 rectangle at position (342, 71).
; PLAN: r0=129(x), r1=112(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=71(y), r7=56(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 112
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 71
LDI r7, 56
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
