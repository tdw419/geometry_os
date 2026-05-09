; DESCRIPTION: Composite: Renders a orange disk with center (289, 227) and radius 28 then Places a cyan 22x100 rectangle at position (124, 50).
; PLAN: r0=289(x), r1=227(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=50(y), r7=22(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 227
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 50
LDI r7, 22
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
