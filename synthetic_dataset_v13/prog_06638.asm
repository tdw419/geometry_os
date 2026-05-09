; DESCRIPTION: Composite: Renders a black disk with center (368, 66) and radius 50 then Places a white 27x93 rectangle at position (264, 31).
; PLAN: r0=368(x), r1=66(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=31(y), r7=27(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 66
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 31
LDI r7, 27
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
