; DESCRIPTION: Composite: Renders a purple disk with center (284, 155) and radius 10 then Places a blue 115x94 rectangle at position (111, 68).
; PLAN: r0=284(x), r1=155(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=68(y), r7=115(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 155
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 68
LDI r7, 115
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
