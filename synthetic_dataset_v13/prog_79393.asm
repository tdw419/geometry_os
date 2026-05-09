; DESCRIPTION: Composite: Renders a black disk with center (113, 93) and radius 62 then Places a red 106x108 rectangle at position (404, 34).
; PLAN: r0=113(x), r1=93(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=34(y), r7=106(width), r8=108(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 93
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 34
LDI r7, 106
LDI r8, 108
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
