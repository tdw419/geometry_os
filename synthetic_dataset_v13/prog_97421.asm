; DESCRIPTION: Composite: Renders a red disk with center (394, 121) and radius 45 then Places a magenta 24x10 rectangle at position (414, 33).
; PLAN: r0=394(x), r1=121(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=33(y), r7=24(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 121
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 33
LDI r7, 24
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
