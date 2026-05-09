; DESCRIPTION: Composite: Renders a purple disk with center (347, 103) and radius 36 then Places a red 55x39 rectangle at position (226, 58).
; PLAN: r0=347(x), r1=103(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=58(y), r7=55(width), r8=39(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 103
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 58
LDI r7, 55
LDI r8, 39
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
