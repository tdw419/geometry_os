; DESCRIPTION: Composite: Renders a red disk with center (193, 154) and radius 17 then Places a red 116x102 rectangle at position (75, 129).
; PLAN: r0=193(x), r1=154(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=129(y), r7=116(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 154
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 129
LDI r7, 116
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
