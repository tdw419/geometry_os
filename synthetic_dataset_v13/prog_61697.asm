; DESCRIPTION: Composite: Renders a white disk with center (138, 166) and radius 46 then Places a purple 107x39 rectangle at position (257, 59).
; PLAN: r0=138(x), r1=166(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=59(y), r7=107(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 166
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 59
LDI r7, 107
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
