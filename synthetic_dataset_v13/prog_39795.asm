; DESCRIPTION: Composite: Renders a blue disk with center (262, 159) and radius 30 then Places a purple 24x119 rectangle at position (307, 124).
; PLAN: r0=262(x), r1=159(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=124(y), r7=24(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 159
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 124
LDI r7, 24
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
