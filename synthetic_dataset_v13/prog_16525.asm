; DESCRIPTION: Composite: Places a white 31x66 rectangle at position (274, 27) then Renders a yellow disk with center (380, 124) and radius 76.
; PLAN: r0=274(x), r1=27(y), r2=31(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=124(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 27
LDI r2, 31
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 124
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
