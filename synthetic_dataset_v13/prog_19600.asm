; DESCRIPTION: Composite: Renders a red disk with center (247, 51) and radius 28 then Places a purple 100x28 rectangle at position (48, 65).
; PLAN: r0=247(x), r1=51(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=65(y), r7=100(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 51
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 65
LDI r7, 100
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
