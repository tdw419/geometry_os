; DESCRIPTION: Composite: Places a magenta circle of radius 55 at center (188, 61) then Places a purple 102x82 rectangle at position (58, 71).
; PLAN: r0=188(x), r1=61(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=71(y), r7=102(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 61
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 71
LDI r7, 102
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
